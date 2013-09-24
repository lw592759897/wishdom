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
	private int currIndex=1;
	private int totlePage=1;
	private int pageIndex=12;
	
	public String indexAction(){
		try{
			Map bigPic=jdbctemplate.queryForMap("SELECT * FROM content WHERE CONTENTID='Homebigpicture' AND CONTENTTYPE='HOMEBIGPICTURECONTENT' AND CONTENTOPT='USED'");
			ServletActionContext.getContext().put("bigPic", bigPic);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try{
			Map mainDs=jdbctemplate.queryForMap("SELECT * FROM content WHERE CONTENTID='Maindspic' AND CONTENTTYPE='MAINDSPICCONTENT' AND CONTENTOPT='USED'");
			ServletActionContext.getContext().put("mainDs", mainDs);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			try{
			Map guanyu=jdbctemplate.queryForMap("SELECT * FROM content WHERE CONTENTID='MaingjContent' AND CONTENTTYPE='MAINGJCONTENT' AND CONTENTOPT='USED'");
				ServletActionContext.getContext().put("guanyu", guanyu);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} 
			try{
				Map zzgy=jdbctemplate.queryForMap("SELECT * FROM content WHERE CONTENTID='MainMakeContent' AND CONTENTTYPE='MAINMAKECONTENT' AND CONTENTOPT='USED'");
				ServletActionContext.getContext().put("zzgy", zzgy);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} 
			List newsList=jdbctemplate.queryForList("SELECT *  from news  ORDER BY  NEWSDATE DESC  limit 0,4");
			ServletActionContext.getContext().put("newsList", newsList);
		return "success";
	}
	public String cominfo(){
		try{
			Map company=jdbctemplate.queryForMap("SELECT * FROM content WHERE CONTENTID='Company' AND CONTENTOPT='USED'");
			ServletActionContext.getContext().put("company", company);
		}catch (Exception e) {
			// TODO: handle exception
		}
		return "success";
	}
	public String news(){
		String newsid=null;
		 List<Map<String,Object>> newsList=null;
		 Map newNews=null;
		 Map newsMap=null;
		 String newsId=request.getParameter("newsid");
		if(newsId!=null&&!"".equals(newsId)){
			int id=Integer.parseInt(newsId);
			try{
			newNews=jdbctemplate.queryForMap("SELECT *  from news WHERE NEWSID='"+id+"' ");
			}catch (Exception e) {
				// TODO: handle exception
			}
			 newsList=jdbctemplate.queryForList("SELECT *  from news  ORDER BY  NEWSDATE DESC  limit 0,4");
			newsid=newsId;
		}else{
		  	 newsList=jdbctemplate.queryForList("SELECT *  from news  ORDER BY  NEWSDATE DESC  limit 0,4");
		    if(newsList!=null&&newsList.size()>0){
		    	 newsid=""+newsList.get(0).get("NEWSID");
		    	 newNews=newsList.get(0);
		    }
	    }
		try{
	     newsMap=jdbctemplate.queryForMap("SELECT * from content where CONTENTID = '"+newsid+"' AND CONTENTTYPE='NEWSCONTENT' AND CONTENTOPT='USED'");
		}catch (Exception e) {
			// TODO: handle exception
		}
	    ServletActionContext.getContext().put("newNews",newNews);
	    ServletActionContext.getContext().put("newsList", newsList);
	    ServletActionContext.getContext().put("newsMap", newsMap);
		return "success";
	}
	//产品分类
	public String pdshow(){
		String catalogId=request.getParameter("catalogId");
		String currPage=request.getParameter("currPage");
		if(currPage!=null&&!"".endsWith(currPage)){
			currIndex=Integer.parseInt(currPage);
		}
		try{
			String sql1="SELECT COUNT(*) FROM product WHERE PRODUCTCATALOG='"+catalogId+"'";
			int totlePages=jdbctemplate.queryForInt(sql1);
			if(totlePages>0){
				totlePage = (totlePages  +  pageIndex  - 1) / pageIndex; 
			}
			String sql="SELECT * FROM product WHERE PRODUCTCATALOG='"+catalogId+"' limit "+ (currIndex-1)*pageIndex+","+pageIndex;
			List productList=jdbctemplate.queryForList(sql);
		
			ServletActionContext.getContext().put("catalogId", catalogId);
			ServletActionContext.getContext().put("currIndex", currIndex);
			ServletActionContext.getContext().put("totlePage", totlePage);
			ServletActionContext.getContext().put("productList", productList);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		return "success";
	}
	public String chzDashi(){
		try{
			Map master=jdbctemplate.queryForMap("SELECT * FROM content WHERE CONTENTID='MasterContent' AND CONTENTTYPE='MASTERCONTENT' AND CONTENTOPT='USED'");
			if(master!=null&&master.size()>0){
				ServletActionContext.getContext().put("master", master);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return "success";
	}
	public String custMode(){
		return "success";
	}
	public String zzgy(){
		String gyId=request.getParameter("gyId");
		String currPage=request.getParameter("currPage");
		if(currPage!=null&&!"".endsWith(currPage)){
			currIndex=Integer.parseInt(currPage);
		}
		try{
			String sql1=null;
			String sql=null;
			if(gyId==null||gyId.equals("")){
				 sql1="SELECT COUNT(*) FROM make_product";
				 sql="SELECT * FROM make_product  limit "+ (currIndex-1)*pageIndex+","+pageIndex;
			}else{
			 sql1="SELECT COUNT(*) FROM make_product WHERE MAKEPRODUCTCATALOG='"+gyId+"'";
			 sql="SELECT * FROM make_product WHERE MAKEPRODUCTCATALOG='"+gyId+"' limit "+ (currIndex-1)*pageIndex+","+pageIndex;
			}
			int totlePages=jdbctemplate.queryForInt(sql1);
			if(totlePages>0){
				totlePage = (totlePages  +  pageIndex  - 1) / pageIndex; 
			}
			List mkproductList=jdbctemplate.queryForList(sql);
			System.out.println(gyId+" "+sql1+" "+sql);
			ServletActionContext.getContext().put("catalogId", gyId);
			ServletActionContext.getContext().put("currIndex", currIndex);
			ServletActionContext.getContext().put("totlePage", totlePage);
			ServletActionContext.getContext().put("mkproductList", mkproductList);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		
		return "success";
	}
	public String gjwh(){
		Map wenhua=jdbctemplate.queryForMap("SELECT * FROM content WHERE CONTENTID='Cultural' AND CONTENTTYPE='CulturalCONTENT' AND CONTENTOPT='USED'");
			ServletActionContext.getContext().put("wenhua", wenhua);
		
		return "success";
	}
	public String productdz(){
		try{
			Map  productLidz=jdbctemplate.queryForMap("SELECT * FROM content WHERE CONTENTID='CommissionContent' AND CONTENTOPT='USED'");
			ServletActionContext.getContext().put("productLidz", productLidz);
		}catch (Exception e) {
			// TODO: handle exception
		} 
		return "success";
	}
	public String productDetail(){ 
		
		String productId=request.getParameter("productId");
		Map producttl=new HashMap();
		if(productId!=null&&!productId.equals("")){
			String sql="SELECT * FROM content WHERE CONTENTTYPE='PRDCONTENT' AND CONTENTOPT='USED' AND CONTENTID='"+productId+"'";
			String sql1="SELECT * FROM content a,product b WHERE a.CONTENTTYPE='PRDDESCONTENT' AND CONTENTOPT='USED' AND a.CONTENTID='"+productId+"' AND a.CONTENTID=b.PRODUCTID";
			try{
				Map productImg=jdbctemplate.queryForMap(sql);
				Map productDetail=jdbctemplate.queryForMap(sql1);
				 List newsList=jdbctemplate.queryForList("SELECT *  from news  ORDER BY  NEWSDATE DESC");
				producttl.put("productImg", productImg);
				producttl.put("productDetail", productDetail);
				producttl.put("newsList", newsList);
				ServletActionContext.getContext().put("producttl",producttl);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		return "success";
	}
	
}
