package com.example.demo;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpSession;

import javax.sql.DataSource;
import java.util.List;

@Configuration
public class DbConfig implements InitializingBean {

    private final DataSourceProperties dataSourceProperties;
    private DataSource myDataSource;

    public DbConfig(DataSourceProperties dataSourceProperties) {
        this.dataSourceProperties = dataSourceProperties;
    }

    // DataSource Bean을 생성하는 메서드
    @Bean(name = "myDataSource")
    public DataSource myDataSource() {
        String sessionCompany = getSessionCompany();
        myDataSource = createDataSource(sessionCompany);
        return myDataSource;
    }

    // JdbcTemplate Bean을 생성하는 메서드
    @Bean
    public JdbcTemplate jdbcTemplate() {
        return new JdbcTemplate(myDataSource());
    }

    // PostConstruct 어노테이션이 붙은 메서드로, 빈이 초기화된 후 초기화 로직을 수행
    @PostConstruct
    private void postConstruct() {
        configureAndInitializeDatabase();
    }

    // InitializingBean을 구현한 메서드로, 빈이 초기화된 후 초기화 로직을 수행
    @Override
    public void afterPropertiesSet() {
        configureAndInitializeDatabase();
    }

    // 데이터베이스를 구성하고 초기화하는 메서드
    private void configureAndInitializeDatabase() {
        String sessionCompany = getSessionCompany();
        DataSource dataSource = myDataSource();

        // 데이터베이스가 존재하지 않으면 생성 // 여기서 초기화 로직을 진행
        if (!databaseExists(sessionCompany, dataSource)) {
            createDatabase(sessionCompany, dataSource);
        }

        // demo 데이터베이스의 테이블 목록을 가져오기
        List<String> tables = getTablesInDatabase("demo", dataSource);

        // 세션 데이터베이스에 demo 데이터베이스의 테이블이 없으면 생성
        for (String table : tables) {
            if (!tableExists(sessionCompany, table, dataSource)) {
                String createTableQuery = "SHOW CREATE TABLE demo." + table;
                String createTableStatement = jdbcTemplate().queryForObject(createTableQuery, String.class);

                // demo 데이터베이스의 테이블 구조를 가져와 세션 데이터베이스에 생성
                if (createTableStatement != null) {
                    jdbcTemplate().execute(
                            createTableStatement.replace("CREATE TABLE demo.", "CREATE TABLE " + sessionCompany + "."));
                } else {
                    // createTableStatement가 null인 경우 처리
                }
            }
        }
    }

    // 데이터베이스가 존재하는지 확인하는 메서드
    private boolean databaseExists(String sessionCompany, DataSource dataSource) {
        try {
            String query = "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = ?";
            jdbcTemplate().queryForObject(query, String.class, sessionCompany);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    // 데이터베이스를 생성하는 메서드
    private void createDatabase(String sessionCompany, DataSource dataSource) {
        String createDatabaseQuery = "CREATE DATABASE IF NOT EXISTS " + sessionCompany;
        jdbcTemplate().execute(createDatabaseQuery);

        // demo 데이터베이스의 테이블 목록을 가져오기
        List<String> tables = getTablesInDatabase("demo", dataSource);

        // demo 데이터베이스의 테이블이 없으면 생성
        for (String table : tables) {
            if (!tableExists(sessionCompany, table, dataSource)) {
                String createTableQuery = "SHOW CREATE TABLE demo." + table;
                String createTableStatement = jdbcTemplate().queryForObject(createTableQuery, String.class);

                // demo 데이터베이스의 테이블 구조를 가져와 세션 데이터베이스에 생성
                if (createTableStatement != null) {
                    jdbcTemplate().execute(
                            createTableStatement.replace("CREATE TABLE demo.", "CREATE TABLE " + sessionCompany + "."));
                } else {
                    // createTableStatement가 null인 경우 처리
                }
            }
        }
    }

    // 특정 테이블이 세션 데이터베이스에 존재하는지 확인하는 메서드
    private boolean tableExists(String databaseName, String tableName, DataSource dataSource) {
        String query = "SHOW TABLES FROM " + databaseName + " LIKE ?";
        return jdbcTemplate().queryForObject(query, String.class, tableName) != null;
    }

    // 특정 데이터베이스의 테이블 목록을 가져오는 메서드
    private List<String> getTablesInDatabase(String databaseName, DataSource dataSource) {
        String query = "SHOW TABLES FROM " + databaseName;
        return jdbcTemplate().queryForList(query, String.class);
    }

    // 세션 데이터베이스를 구분하기 위한 세션 값 가져오는 메서드
    private String getSessionCompany() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attributes != null) {
            HttpSession session = attributes.getRequest().getSession();
            if (session != null) {
                String sessionId = (String) session.getAttribute("id");
                if (sessionId != null && !sessionId.trim().isEmpty()) {
                    return sessionId;
                }
            }
        }
        return "demo";
    }

    // 세션 데이터베이스를 생성하는 메서드
    private DataSource createDataSource(String sessionCompany) {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(dataSourceProperties.getDriverClassName());
        dataSource.setUsername(dataSourceProperties.getUsername());
        dataSource.setPassword(dataSourceProperties.getPassword());
        dataSource.setUrl(dataSourceProperties.getUrl() + sessionCompany);
        return dataSource;
    }
}