package com.elink.action;

import org.springframework.jdbc.core.JdbcTemplate;

import com.elink.common.dbConUtil;
import com.opensymphony.xwork2.ActionSupport;

public class mainAction extends ActionSupport{
	
	public String indexAction(){
		JdbcTemplate jdbctemplate = dbConUtil.getCon();
		return "success";
	}
	
}
