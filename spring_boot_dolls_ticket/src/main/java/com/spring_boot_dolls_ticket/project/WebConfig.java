package com.spring_boot_dolls_ticket.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Autowired
	private AdminInterceptor adminInterceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// upload 폴더 이미지 출력하기 위해 맵핑 설정
		registry.addResourceHandler("/image/**")
				//.addResourceLocations("classpath:/static/image/");
				.addResourceLocations("file:///usr/local/project/upload/"); // 서버 경로
	}
	
	@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/admin/**"); // /admin 경로에 대해 인터셉터 적용
    }
	
}
