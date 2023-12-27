// package com.example.demo;

// import org.springframework.beans.factory.annotation.Value;
// import org.springframework.dao.EmptyResultDataAccessException;
// import org.springframework.jdbc.core.JdbcTemplate;
// import org.springframework.stereotype.Service;

// import javax.sql.DataSource;
// import com.zaxxer.hikari.HikariConfig;
// import com.zaxxer.hikari.HikariDataSource;

// import java.util.List;
// import java.util.Map;

// @Service
// public class DbConfig {

// private final JdbcTemplate jdbcTemplate;

// @Value("${spring.datasource.url}")
// private String jdbcUrl;

// public DbConfig(JdbcTemplate jdbcTemplate) {
// this.jdbcTemplate = jdbcTemplate;
// }

// public void setDynamicDatabase(String newDatabaseName) {
// try {
// String dynamicUrl = "jdbc:mariadb://db.itbank08.link:3306/" +
// newDatabaseName;

// // 1. 새로운 데이터베이스 생성 또는 기존 데이터베이스 선택
// createOrUseDatabase(newDatabaseName);

// // 2. 기존 데이터베이스의 테이블 구조를 복사
// List<String> tables = getTablesInDatabase("demo");

// for (String table : tables) {
// updateTableStatements(newDatabaseName, table);
// }

// // 3. 새로운 데이터베이스로 DataSource 변경
// DataSource newDataSource = buildDataSource(dynamicUrl);
// jdbcTemplate.setDataSource(newDataSource);
// } catch (Exception e) {
// e.printStackTrace(); // 나중에 로그로 변경하는 것이 좋습니다.
// // 그 외 필요한 작업 수행
// }
// }

// private void createOrUseDatabase(String newDatabaseName) {
// if (!databaseExists(newDatabaseName)) {
// // 새로운 데이터베이스 생성
// createDatabase(newDatabaseName);
// } else {
// // 기존 데이터베이스 선택
// jdbcTemplate.execute("USE " + newDatabaseName);
// }
// }

// private void updateTableStatements(String databaseName, String table) {
// if (!tableExists(databaseName, table)) {
// String createTableQuery = "SHOW CREATE TABLE `demo`.`" + table + "`";

// try {
// // Use query method to get the result list
// List<Map<String, Object>> createTableResultList =
// jdbcTemplate.queryForList(createTableQuery);

// if (!createTableResultList.isEmpty()) {
// // Extract the create table statement from the first row
// String createTableResult = (String) createTableResultList.get(0).get("Create
// Table");

// String modifiedCreateTableStatement = createTableResult
// .replace("CREATE TABLE demo.", "CREATE TABLE " + databaseName + ".");

// jdbcTemplate.execute(modifiedCreateTableStatement);
// } else {
// // Handle the case where createTableResultList is empty
// }
// } catch (EmptyResultDataAccessException e) {
// // Handle the case where there is no result
// }
// }
// }

// private DataSource buildDataSource(String url) {
// HikariConfig hikariConfig = new HikariConfig();
// hikariConfig.setJdbcUrl(url);
// hikariConfig.setUsername("admin"); // 사용자 이름 설정
// hikariConfig.setPassword("mariapass"); // 패스워드 설정
// // 다른 필요한 설정도 추가할 수 있습니다.

// return new HikariDataSource(hikariConfig);
// }

// private boolean databaseExists(String databaseName) {
// try {
// String query = "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE
// SCHEMA_NAME = ?";
// jdbcTemplate.queryForObject(query, String.class, databaseName);
// return true;
// } catch (EmptyResultDataAccessException e) {
// return false;
// }
// }

// private void createDatabase(String databaseName) {
// try {
// String createDatabaseQuery = "CREATE DATABASE IF NOT EXISTS " + databaseName;
// jdbcTemplate.execute(createDatabaseQuery);

// // 생성된 데이터베이스로 스위치
// jdbcTemplate.execute("USE " + databaseName);
// } catch (Exception e) {
// e.printStackTrace(); // 나중에 로그로 변경하는 것이 좋습니다.
// // 그 외 필요한 작업 수행
// }
// }

// private boolean tableExists(String databaseName, String tableName) {
// String query = "SHOW TABLES FROM " + databaseName + " LIKE ?";
// List<String> result = jdbcTemplate.queryForList(query, String.class,
// tableName);
// return !result.isEmpty();
// }

// private List<String> getTablesInDatabase(String databaseName) {
// String query = "SHOW TABLES FROM " + databaseName;
// return jdbcTemplate.queryForList(query, String.class);
// }
// }