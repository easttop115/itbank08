package com.example.demo;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import jakarta.servlet.http.HttpSession;

import java.util.List;

import javax.sql.DataSource;

@Configuration
public class DbConfig implements InitializingBean {

    @Autowired
    private DataSourceProperties dataSourceProperties;

    @Autowired
    private HttpSession session;

    private DataSource dataSource;

    @Override
    public void afterPropertiesSet() {
        // sessionid에 따라 동적으로 DataSource 생성 및 설정

        // 현재 세션에 저장된 "Company" 속성을 이용하여 동적으로 데이터베이스 연결 정보를 설정합니다.
        String sessionCompany = getSessionCompany();
        // 데이터베이스가 존재하지 않으면 생성
        if (!databaseExists(sessionCompany)) {
            createDatabase(sessionCompany);
        }

        // 기존의 데이터베이스 연결 속성을 이용하여 새로운 데이터베이스 연결 속성을 설정합니다.
        DataSourceProperties properties = new DataSourceProperties();
        properties.setDriverClassName(dataSourceProperties.getDriverClassName());
        properties.setUsername(dataSourceProperties.getUsername());
        properties.setPassword(dataSourceProperties.getPassword());
        properties.setUrl(dataSourceProperties.getUrl() + sessionCompany);

        // 새로운 데이터베이스 연결을 빌드하여 설정합니다.
        this.dataSource = properties.initializeDataSourceBuilder().build();
    }

    private boolean databaseExists(String sessionCompany) {
        try {
            // 데이터베이스가 존재하는지 확인하는 로직 추가
            String query = "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = ?";
            jdbcTemplate(dataSource).queryForObject(query, String.class, sessionCompany);

            // 예외가 발생하지 않으면 데이터베이스가 존재한다고 간주
            return true;
        } catch (Exception e) {
            // 쿼리 수행 중 오류가 발생하면 데이터베이스가 존재하지 않는 것으로 간주
            return false;
        }
    }

    private void createDatabase(String sessionCompany) {
        // 새로운 데이터베이스 생성
        String createDatabaseQuery = "CREATE DATABASE IF NOT EXISTS " + sessionCompany;
        jdbcTemplate(dataSource).execute(createDatabaseQuery);

        // demo 데이터베이스의 테이블 목록 가져오기
        List<String> tables = getTablesInDatabase("demo");

        // 각 테이블의 구조를 가져와서 새로운 데이터베이스에 적용
        for (String table : tables) {
            // 테이블이 이미 존재하는지 확인
            if (!tableExists(sessionCompany, table)) {
                String createTableQuery = "SHOW CREATE TABLE demo." + table;
                String createTableStatement = jdbcTemplate(dataSource).queryForObject(createTableQuery, String.class);

                // 테이블 생성
                jdbcTemplate(dataSource).execute(
                        createTableStatement.replace("CREATE TABLE demo.", "CREATE TABLE " + sessionCompany + "."));
            }
        }
    }

    private boolean tableExists(String databaseName, String tableName) {
        String query = "SHOW TABLES FROM " + databaseName + " LIKE ?";
        return jdbcTemplate(dataSource).queryForObject(query, Integer.class, tableName) != null;
    }

    private List<String> getTablesInDatabase(String databaseName) {
        String query = "SHOW TABLES FROM " + databaseName;
        return jdbcTemplate(dataSource).queryForList(query, String.class);
    }

    @Bean
    public DataSource dataSource() {
        // 애플리케이션에서 사용할 데이터베이스 연결을 빈으로 등록합니다.
        return this.dataSource;
    }

    @Bean
    public JdbcTemplate jdbcTemplate(DataSource dataSource) {
        // JdbcTemplate을 빈으로 등록하고 이를 통해 SQL 쿼리를 실행할 수 있게 합니다.
        return new JdbcTemplate(dataSource);
    }

    private String getSessionCompany() {
        // 현재 요청의 속성을 얻어오기 위해 RequestContextHolder를 사용합니다.
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attributes != null) {
            // 세션에 "id" 속성이 이미 존재하는지 확인합니다.
            String sessionId = (String) session.getAttribute("id");
            if (sessionId != null && !sessionId.trim().isEmpty()) {
                // 로그인 상태인 경우에는 세션에 있는 "id"를 반환합니다.
                return sessionId;
            }
        }
        // 세션이 없을 경우 기본값 "demo"를 반환합니다.
        return "demo";
    }
}