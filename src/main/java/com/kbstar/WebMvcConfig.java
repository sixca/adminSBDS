//웹어플리케이션에서 사용할 수 있는 폴더들을 지정
//웹에서 127.0.0.1/logs/ 이렇게 폴더에 접근하는 것임
package com.kbstar;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Value("${imgdir}")
	String imgdir;
	@Value("${logdir}")
	String logdir;
	//위 두개의 디렉토리를

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/uimg/**").addResourceLocations(imgdir);
		registry.addResourceHandler("/logs/**").addResourceLocations(logdir);
	}
	//웹어플리케이션에서 사용할 수 있게 다른 디렉토리를 등록

//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(new LoginCheckInterceptor()) //인터셉터 등록. 여기서 LoginCheckInterceptor()은 내가 구현한 클래스 이름이다.
//				.order(1) //낮을 수록 먼저 호출
//				.addPathPatterns("/**") //인터셉터를 적용할 url 패턴
//				.excludePathPatterns("/css/**", "/js/**", "/login", "/register","/registerimpl", "/loginimpl", "/vendor/**","/webjars/**"); //인터셉터에서 제외할 패턴 지정
//
//	}

}
