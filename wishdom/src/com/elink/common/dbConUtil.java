package com.elink.common;

import javax.sql.DataSource;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.core.JdbcTemplate;

public class dbConUtil {
	
	private static ApplicationContext ac = null;
	private static Resource resource = null;
	private static BeanFactory ctx = null;
	private static DataSource ds = null;
	private static JdbcTemplate jdbc = null;
	
	private static void init(){
//		if(ctx==null){
		if(ac==null){
//			resource= new ClassPathResource("ApplicationContext.xml");
//			ctx=new XmlBeanFactory(resource);
			ac = new ClassPathXmlApplicationContext("ApplicationContext.xml");
		}
		if(ds==null){
//			ds = ctx.getBean(DataSource.class);
			ds = ac.getBean(DataSource.class);
		}
		if(jdbc==null){
			jdbc = new JdbcTemplate(ds);
		}
	}
	
	public static JdbcTemplate getCon(){
		if(jdbc==null){
			init();
		}
		return jdbc;
	}
}
