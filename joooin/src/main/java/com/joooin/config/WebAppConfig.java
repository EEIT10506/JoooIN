package com.joooin.config;

import javax.servlet.ServletContext;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.support.OpenSessionInViewInterceptor;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.resource.VersionResourceResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.ResourceBundleViewResolver;

import com.joooin.interceptor.MemberInterceptor;
import com.joooin.system.admin._03.interceptor.LoginInterceptor;
import com.joooin.system.event._35.interceptor.EventInter;



@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.joooin")
public class WebAppConfig extends WebMvcConfigurerAdapter {

	@Autowired
	ServletContext context;
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	MemberInterceptor memberInterceptor;

	@Bean
	public ViewResolver jspViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
	@Bean
	public ViewResolver pdfViewResolver() {
		ResourceBundleViewResolver pdfView = new ResourceBundleViewResolver();
		pdfView.setBasename("views");
		pdfView.setOrder(1);
		return pdfView;
	}
	
	@Bean
	public LoginInterceptor loginInterceptor() {
		return new LoginInterceptor();
	}
	@Bean
	public EventInter addEventInter() {
		return new EventInter();
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		OpenSessionInViewInterceptor sessionInterceptor = new OpenSessionInViewInterceptor();
	    sessionInterceptor.setSessionFactory(sessionFactory);
	    registry.addWebRequestInterceptor(sessionInterceptor);	 
	    registry.addInterceptor(memberInterceptor).addPathPatterns("/member").addPathPatterns("/member/**").excludePathPatterns("/member/other/**");
	    registry.addInterceptor(loginInterceptor()).addPathPatterns("/login"); // 字串可用,隔開 指定controller路徑將會攔截返回登入頁面
	    registry.addInterceptor(addEventInter());
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**")
        		.addResourceLocations("/WEB-INF/resources/")
        		.resourceChain(true).addResolver(
        		new VersionResourceResolver().addContentVersionStrategy("/**"));
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
	    multipartResolver.setMaxUploadSize(1000000);
	    multipartResolver.setDefaultEncoding("UTF-8");
	    return multipartResolver;
	}
	
	
}
