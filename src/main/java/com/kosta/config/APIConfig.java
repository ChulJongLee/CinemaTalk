package com.kosta.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
@MapperScan(basePackages = {"com.kosta.mapper"})
@ComponentScan(basePackages = {"com.kosta.service"})
public class APIConfig {

	@Bean
	public RestTemplate restTemplate() {
		
		return new RestTemplate();
	}

}
