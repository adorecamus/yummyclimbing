package com.yummyclimbing.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.yummyclimbing.interceptor.AuthInterceptorForAPI;
import com.yummyclimbing.interceptor.AuthInterceptorForPage;

import lombok.AllArgsConstructor;

@Configuration
@AllArgsConstructor
public class WebConfig implements WebMvcConfigurer {

	private AuthInterceptorForPage authInterceptorForPage;
	
	private AuthInterceptorForAPI authInterceptorForAPI;
	
	@Value("${auth.required.pages}")
	private List<String> requiredPages;	// 화면 이동시 권한 필요한 주소
	
	@Value("${auth.required.apis}")
	private List<String> requiredAPIs;	// 컨트롤러 메소드 호출 시 권한 필요한 주소(매핑된 주소)
	
	private static final String BASE_PATH;
	static {
		String osName = System.getProperty("os.name");
		if(osName.toUpperCase().contains("WINDOW")) {
			BASE_PATH = "file:///C:";
		} else {
			BASE_PATH = "file:///";
		}
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/files/**")
		.addResourceLocations(BASE_PATH + "/images/community/");
		
		registry.addResourceHandler("/userImg/**")
		.addResourceLocations(BASE_PATH + "/images/profile/");
	}
	
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptorForPage)
		.addPathPatterns(requiredPages);
		
		registry.addInterceptor(authInterceptorForAPI)
		.addPathPatterns(requiredAPIs)
		.excludePathPatterns("/views/**","/");
	}
	
	// 파일 처리용 빈 
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8"); 	// 파일 인코딩 설정
		multipartResolver.setMaxUploadSizePerFile(5 * 1024 * 1024); // 파일당 업로드 크기 제한 (5MB)
		return multipartResolver;
	} 
	
}
