package com.yummyclimbing.config;

import java.util.Random;

import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.client.RestTemplate;


@Configuration
public class BeanConfig {
	
	@Bean
	public RestTemplate restTemplate() {
		return new RestTemplate();
	} // rest template bean

	@Bean
	public PropertiesFactoryBean envProperties() {
		PropertiesFactoryBean bean = new PropertiesFactoryBean();
		bean.setLocation(new ClassPathResource("/env.properties"));
		return bean;
	} //  jsp jstl에서 사용하기 위한 property bean
	
	@Bean
	public Random random() {
		return new Random();
	} // 소소모임 랜덤 아이콘, 산&소소모임 랜덤 추천에서 사용
	
}
