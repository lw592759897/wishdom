package com.elink.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.elink.common.dbConUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class mainAction extends ActionSupport{
	
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	private HttpSession session=request.getSession();
	private JdbcTemplate jdbctemplate = dbConUtil.getCon();
	private ActionContext context=ServletActionContext.getContext();
	
	public String indexAction(){
		
		return "success";
	}
	public String cominfo(){
		System.out.println("start..........");
		return "success";
	}
	public String news(){
		System.out.println("start..........");
		return "success";
	}
	//产品分类
	public String pdshow(){
		String catalogId=request.getParameter("catalogId");
		try{
			List productList=jdbctemplate.queryForList("SELECT * FROM product WHERE PRODUCTCATALOG='"+catalogId+"'");
			ServletActionContext.getContext().put("productList", productList);
		}catch (Exception e) {
			// TODO: handle exception
		} 
		return "success";
	}
	public String chzDashi(){
		System.out.println("start..........");
		return "success";
	}
	public String custMode(){
		System.out.println("start..........");
		return "success";
	}
	public String zzgy(){
		System.out.println("start..........");
		return "success";
	}
	public String gjwh(){
		System.out.println("start..........");
		return "success";
	}
	public String productDetail(){ 
		
		String productId=request.getParameter("productId");
		Map producttl=new HashMap();
		if(productId!=null&&!productId.equals("")){
			String sql="SELECT * FROM content WHERE CONTENTTYPE='PRDCONTENT' AND CONTENTID='"+productId+"'";
			String sql1="SELECT * FROM content a,product b WHERE a.CONTENTTYPE='PRDDESCONTENT' AND a.CONTENTID='"+productId+"' AND a.CONTENTID=b.PRODUCTID";
			try{
				Map productImg=jdbctemplate.queryForMap(sql);
				Map productDetail=jdbctemplate.queryForMap(sql1);
				producttl.put("productImg", productImg);
				producttl.put("productDetail", productDetail);
				System.out.println(productDetail );
				System.out.println(productImg );
				ServletActionContext.getContext().put("producttl",producttl);
				return "success";
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		return "success";
	}
	
}
