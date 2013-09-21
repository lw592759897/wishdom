package com.elink.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.struts2.ServletActionContext;
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
//	private static HttpServletRequest requst=ServletActionContext.getRequest();
//	private static HttpServletResponse response=ServletActionContext.getResponse();
//	private static HttpSession session=requst.getSession();
	
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
	public static UserLogin getUser(HttpSession session){
		
		return (UserLogin)session.getAttribute("userLogin");
	}
}
