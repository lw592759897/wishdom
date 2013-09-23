package com.elink.common;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class dbConUtil {
	
	private static ApplicationContext ac = null;
	private static DataSource ds = null;
	private static JdbcTemplate jdbc = null;
	
	private static void init(){
		if(ac==null){
			ac = new ClassPathXmlApplicationContext("ApplicationContext.xml");
		}
		if(ds==null){
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
