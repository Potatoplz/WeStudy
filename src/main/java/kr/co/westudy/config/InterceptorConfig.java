package kr.co.westudy.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.westudy.login.LoginCheckInterceptor_member;

	@Configuration
	public class InterceptorConfig implements WebMvcConfigurer {

		@Override
		public void addInterceptors(InterceptorRegistry registry) {
			registry.addInterceptor(new LoginCheckInterceptor_member())
			.excludePathPatterns("/cafe/*")
			.addPathPatterns("/entity/*")
			.excludePathPatterns("/join/*")
			.excludePathPatterns("/login/*")
			.excludePathPatterns("/map/*")
			.excludePathPatterns("/repository/*")
			.excludePathPatterns("/study/*")
			.excludePathPatterns("/study_rest/*")
			.excludePathPatterns("/util/*")
			.excludePathPatterns("/vo/*")
			;
		}//addInterceptors

	}//class