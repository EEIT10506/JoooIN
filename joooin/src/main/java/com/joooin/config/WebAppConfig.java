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


@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.joooin")
public class WebAppConfig extends WebMvcConfigurerAdapter {

	@Autowired
	ServletContext context;
	@Autowired
	SessionFactory sessionFactory;

	@Bean
	public ViewResolver jspViewResolver() {
		System.out.println("jspViewResolver");
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
	@Bean
	public ViewResolver pdfViewResolver() {
		System.out.println("pdfViewResolver");
		ResourceBundleViewResolver pdfView = new ResourceBundleViewResolver();
		pdfView.setBasename("views");
		pdfView.setOrder(1);
		return pdfView;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		OpenSessionInViewInterceptor sessionInterceptor = new OpenSessionInViewInterceptor();
	    sessionInterceptor.setSessionFactory(sessionFactory);
	    registry.addWebRequestInterceptor(sessionInterceptor);
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
