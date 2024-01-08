package com.example.demo;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.util.List;

@Service
public class DbConfig {

    private final JdbcTemplate jdbcTemplate;

    public DbConfig(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private String defaultUserName = "demo";

    public void setDynamicDatabase(String userName) { // 동적으로 DB에 연결하는 메서드
        try {
            String dynamicUrl = "jdbc:mariadb://db.itbank08.link:3306/" + userName;
            DataSource newDataSource = buildDataSource(dynamicUrl, userName);
            jdbcTemplate.setDataSource(newDataSource);
        } catch (Exception e) {
            logError("setDynamicDatabase 메소드에서 오류 발생", e);
        }
    }

    public void setLogoutDatabase() {
        try {
            String dynamicUrl = "jdbc:mariadb://db.itbank08.link:3306/" + defaultUserName;
            DataSource newDataSource = buildDataSource(dynamicUrl, "admin");
            jdbcTemplate.setDataSource(newDataSource);
        } catch (Exception e) {
            logError("setLogoutDatabase 메소드에서 오류 발생", e);
        }
    }

    protected DataSource buildDataSource(String url, String id) { // 동적으로 DB연결 주소 pool
        HikariConfig hikariConfig = new HikariConfig();
        hikariConfig.setJdbcUrl(url);
        hikariConfig.setUsername(id);
        hikariConfig.setPassword("mariapass");

        return new HikariDataSource(hikariConfig);
    }

    public void createSetDatabase(String userName) { // 회원가입 승인 후 demo 데이터베이스 복제
        try {
            if (!databaseExists(userName)) {
                createDatabase(userName);
                createUserAndGrantPrivileges(userName);
                List<String> tables = getTablesInDatabase();

                for (String table : tables) {
                    updateTableStatements(userName, table);
                    // 여기에 특정한 테이블 값에 대한 로직 추가
                    if ("orderStatus".equals(table)) {
                        // 특정한 테이블에 데이터 추가하는 로직
                        addDataToTable(table);
                    }
                }
            } else {
                jdbcTemplate.execute("USE " + userName);

                String grantPrivilegesQuery = "GRANT ALL PRIVILEGES ON " + userName + ".* TO ?@'%'";
                jdbcTemplate.update(grantPrivilegesQuery, userName);

                List<String> tables = getTablesInDatabase();
                for (String table : tables) {
                    String grantReadPermissionQuery = "GRANT SELECT ON " + userName + "." + table + " TO ?@'%'";
                    jdbcTemplate.update(grantReadPermissionQuery, userName);
                }

                jdbcTemplate.execute("USE " + defaultUserName);
            }
        } catch (Exception e) {
            logError("데이터베이스 생성, 테이블 복제, 유저 생성 및 권한 부여 실패", e);
        }
    }

    protected void createDatabase(String databaseName) { // 1. 데이터 베이스 생성
        try {
            String createDatabaseQuery = "CREATE DATABASE IF NOT EXISTS " + databaseName;
            jdbcTemplate.execute(createDatabaseQuery);
            System.out.println("데이터베이스 생성 완료: " + databaseName);
        } catch (Exception e) {
            logError("데이터베이스 생성 실패", e);
        }
    }

    protected void createUserAndGrantPrivileges(String userName) { // 1.사용자 계정 생성 및 권한 부여
        try {
            if (!userExists(userName)) {
                // CREATE USER 쿼리 수정
                String createUserQuery = "CREATE USER ?@'%' IDENTIFIED BY 'mariapass'";
                jdbcTemplate.update(createUserQuery, userName);

                String grantPrivilegesQuery = "GRANT ALL PRIVILEGES ON '" + userName + "''.* TO ?@'%'";
                jdbcTemplate.update(grantPrivilegesQuery, userName);

                System.out.println("계정 생성 및 권한 부여 완료: " + userName);
            } else {
                System.out.println("사용자 이미 존재함: " + userName);
            }
        } catch (Exception e) {
            logError("사용자계정 생성 및 권한 생성 실패", e);
        }
    }

    protected void updateTableStatements(String userName, String table) {
        if (!tableExists(userName, table)) {
            // 'CREATE TABLE' 쿼리 실행 코드 추가
            String createTableQuery = "SHOW CREATE TABLE `" + defaultUserName + "`.`" + table + "`";

            try {
                // 두 번째 컬럼에 해당하는 타입으로 매핑하도록 수정
                String createTableStatement = jdbcTemplate.queryForObject(createTableQuery,
                        (rs, rowNum) -> rs.getString(2));

                // 새로운 사용자의 데이터베이스에 'CREATE TABLE' 쿼리 실행
                jdbcTemplate.execute("USE " + userName);
                jdbcTemplate.execute(createTableStatement);

                System.out.println("테이블 생성 완료: " + userName + "." + table);
                jdbcTemplate.execute("USE " + defaultUserName);
            } catch (EmptyResultDataAccessException e) {
                logError("updateTableStatements 메소드에서 오류 발생", e);
            }
        }
    }

    protected List<String> getTablesInDatabase() {
        try {
            String query = "SHOW TABLES FROM " + defaultUserName;
            return jdbcTemplate.queryForList(query, String.class);
        } catch (Exception e) {
            logError("getTablesInDatabase 메소드에서 오류 발생", e);
            throw new RuntimeException("테이블 목록을 가져오는 동안 오류가 발생했습니다.", e);
        }
    }

    protected void addDataToTable(String table) { // 테이블 내부 데이터 복제

        try {
            String insertSql = "INSERT INTO " + table + " (no, status) VALUES (?, ?)";

            // 쿼리 실행
            jdbcTemplate.update(insertSql, 1, "request");
            jdbcTemplate.update(insertSql, 2, "approval");
            jdbcTemplate.update(insertSql, 3, "reject");
            jdbcTemplate.update(insertSql, 4, "deliver");
            jdbcTemplate.update(insertSql, 5, "receive");

            System.out.println("데이터 추가 완료");
        } catch (Exception e) {
            logError("데이터 추가 중 오류 발생", e);
        }

        // 다른 테이블에 대한 추가 로직을 추가할 수 있습니다.
    }

    protected boolean databaseExists(String databaseName) {
        try {
            String query = "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = ?";
            jdbcTemplate.queryForObject(query, String.class, databaseName);
            System.out.println("데이터베이스 존재함: " + databaseName);
            return true;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

    protected boolean tableExists(String databaseName, String tableName) {
        try {
            String query = "SHOW TABLES FROM " + databaseName + " LIKE ?";
            List<String> result = jdbcTemplate.queryForList(query, String.class, tableName);
            return !result.isEmpty();
        } catch (Exception e) {
            logError("tableExists 메소드에서 오류 발생", e);
            return false;
        }
    }

    protected boolean userExists(String userName) {
        try {
            String query = "SELECT user FROM mysql.user WHERE user = ?";
            jdbcTemplate.queryForObject(query, String.class, userName);
            return true;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

    private void logError(String message, Exception e) {
        System.err.println(message);
        e.printStackTrace();
    }
}