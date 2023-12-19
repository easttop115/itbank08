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

        // 기존의 데이터베이스 연결 속성을 이용하여 새로운 데이터베이스 연결 속성을 설정합니다.
        DataSourceProperties properties = new DataSourceProperties();
        properties.setDriverClassName(dataSourceProperties.getDriverClassName());
        properties.setUsername(dataSourceProperties.getUsername());
        properties.setPassword(dataSourceProperties.getPassword());
        properties.setUrl(dataSourceProperties.getUrl() + sessionCompany);

        // 새로운 데이터베이스 연결을 빌드하여 설정합니다.
        this.dataSource = properties.initializeDataSourceBuilder().build();
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
