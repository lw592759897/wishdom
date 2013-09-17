package com.elink.action;

import org.springframework.jdbc.core.JdbcTemplate;

import com.elink.common.dbConUtil;
import com.opensymphony.xwork2.ActionSupport;

public class mainAction extends ActionSupport{
	
	public String indexAction(){
		JdbcTemplate jdbctemplate = dbConUtil.getCon();
		return "success";
	}
	public String cominfo(){
		JdbcTemplate jdbctemplate = dbConUtil.getCon();
		System.out.println("start..........");
		return "success";
	}
	public String pdshow(){
		JdbcTemplate jdbctemplate = dbConUtil.getCon();
		System.out.println("start..........");
		return "success";
	}
	public String chzDashi(){
		JdbcTemplate jdbctemplate = dbConUtil.getCon();
		System.out.println("start..........");
		return "success";
	}
	public String custMode(){
		JdbcTemplate jdbctemplate = dbConUtil.getCon();
		System.out.println("start..........");
		return "success";
	}
	public String zzgy(){
		JdbcTemplate jdbctemplate = dbConUtil.getCon();
		System.out.println("start..........");
		return "success";
	}
	
}
