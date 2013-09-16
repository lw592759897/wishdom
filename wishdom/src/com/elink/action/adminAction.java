package com.elink.action;

import java.io.File;

import org.apache.struts2.ServletActionContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.elink.common.dbConUtil;
import com.opensymphony.xwork2.ActionSupport;

public class adminAction extends ActionSupport{
	
	public String loginAction(){
		
		return "success";
	}
	
	public String add_product(){
		return "success";
	}
	
	public String add_news(){
		return "success";
	}
	
	public String upload_img(){
		String root = ServletActionContext.getServletContext().getRealPath("/");  
        //创建文件夹  
        File dirs = new File(root+"upload");  
        System.out.println(" ---- dirs ---- " + dirs);
        if(!dirs.exists()){  
            dirs.mkdirs();  
        }
		return null;
	}
	
}
