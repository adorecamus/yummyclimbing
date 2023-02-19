package com.yummyclimbing;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@MapperScan
@EnableAspectJAutoProxy
@EnableScheduling
public class YummyClimbingApplication {
	public static void main(String[] args) {
		SpringApplication.run(YummyClimbingApplication.class, args);
	}
}
