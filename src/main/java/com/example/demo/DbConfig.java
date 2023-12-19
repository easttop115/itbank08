package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import jakarta.servlet.http.HttpSession;

import javax.sql.DataSource;

@Configuration
public class DbConfig { // 회원에 따라 mariaDB의 데이터를 바꾸기 위한 작업

    @Autowired
    private DataSourceProperties dataSourceProperties; // properties에 저장된 값을 불러오기

    @Autowired
    private HttpSession session;

    @Bean
    public DataSource dataSource() {
        // sessionid에 따라 동적으로 DataSource 생성 및 설정
        String sessionCompany = getSessionCompany(); // sessionid를 가져오는 로직

        DataSourceProperties properties = new DataSourceProperties();
        properties.setDriverClassName(dataSourceProperties.getDriverClassName());
        properties.setUsername(dataSourceProperties.getUsername());
        properties.setPassword(dataSourceProperties.getPassword());
        properties.setUrl(dataSourceProperties.getUrl() + sessionCompany); // 사용자(회사) 정보에 따라

        return properties.initializeDataSourceBuilder().build();
    }

    @Bean
    public JdbcTemplate jdbcTemplate(DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }

    private String getSessionCompany() {
        String sessionCompany = (String) session.getAttribute("Company");
        if (sessionCompany == null || sessionCompany.trim().isEmpty()) {
            return "demo"; // 기본값은 demo로 설정
        }
        return sessionCompany;
    }
}