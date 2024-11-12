package com.spring_boot_dolls_ticket.project;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity // WEB 보안 기능에 아래 클래스 내용 추가해서 활성화
public class WebSecurityConfig {
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
		// BCryptPasswordEncoder는 BCrypt 라는 해시함수를 이용하여 패스워드를 암호화하는 객체
	}
	
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		// 스프링 자체가 제공하는 보안기능중에 불필요한(기능 구현을 하지 않을) 보안기능을 비활성화 시키는 코드
		// 이 내용 추가하지 않으면 비밀번호를 암호화 하도록 구성하면 스프링 시큐리티가 자동 동작하고
		// 로그인 기능이  스프링 기본 로그인으로 동작하게 됨
		// 스프링 보안을 활용하면 로그인 기능은 포함되어 있고 기본 로그인이 됨
		http
			.csrf(csrf->csrf.disable())
			.formLogin(formLogin->formLogin.disable())
			.headers(headerConfig->headerConfig.frameOptions(frameOptionsConfig->frameOptionsConfig.disable()));
		
		return http.build();
	}
}
