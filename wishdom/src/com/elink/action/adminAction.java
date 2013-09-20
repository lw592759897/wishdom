package com.elink.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.elink.common.Data2Json;
import com.elink.common.dbConUtil;
import com.opensymphony.xwork2.ActionSupport;

public class adminAction extends ActionSupport{
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	private static JdbcTemplate jdbctemplate = dbConUtil.getCon();
	
	private File productimg;
	private String fileName;

	public String getFileName() {
		return fileName;
	}

	public void setProductimgFileName(String fileName) {
		this.fileName = fileName;
	}

	public File getProductimg() {
		return productimg;
	}

	public void setProductimg(File productimg) {
		this.productimg = productimg;
	}

	public String loginAction(){
		
		return "success";
	}
	
	public String list_product(){
		List<Map<String, Object>> productlist = jdbctemplate.queryForList("SELECT PRODUCTID, PRODUCTNAME, PRODUCTCATALOG, PRODUCTSHOW, PRODUCTSHOWHEAD FROM product");
		if(productlist!=null && productlist.size()>0){
			ServletActionContext.getContext().put("products", Data2Json.data2json(productlist));
		}else{
			ServletActionContext.getContext().put("products", null);
		}
		return "success";
	}
	
	public String add_product(){
		String productId = request.getParameter("productId");
		if(StringUtils.isNotEmpty(productId)){
			List<Map<String, Object>> product = null;
			product = jdbctemplate.queryForList("SELECT * FROM product WHERE PRODUCTID = ?", new Object[]{productId});
			if(product!=null && product.size() > 0){
				ServletActionContext.getContext().put("product", product.get(0));
			}
		}
		return "success";
	}
	
	public String add_productcontent(){
		String productId = request.getParameter("productId");
		if(StringUtils.isNotEmpty(productId)){
			List<Map<String, Object>> product = null;
			product = jdbctemplate.queryForList("SELECT * FROM product WHERE PRODUCTID = ?", new Object[]{productId});
			if(product!=null && product.size() > 0){
				List<Map<String, Object>> productcontents = jdbctemplate.queryForList("SELECT CONTENT FROM content WHERE CONTENTID = ? AND CONTENTOPT = 'USED' AND CONTENTTYPE = 'PRDCONTENT'", new Object[]{productId});
				if( productcontents != null && productcontents.size() > 0){
					ServletActionContext.getContext().put("productcontents", productcontents.get(0));
				}else{
					List<Map<String, Object>> contentdemo = jdbctemplate.queryForList("SELECT CONTENT FROM content WHERE CONTENTID = ? AND CONTENTOPT = 'DEMOCONTENT' AND CONTENTTYPE = 'PRDCONTENT'", new Object[]{"DemoProductContent"});
					if( contentdemo != null && contentdemo.size() > 0){
						ServletActionContext.getContext().put("productcontents", contentdemo.get(0));
					}else{
						ServletActionContext.getContext().put("productcontents", "NO CONTENT");
					}
				}
				ServletActionContext.getContext().put("productId", productId);
			}
		}
		return "success";
	}
	
	public String update_productcontent(){
		PrintWriter out = null;
		String result = "error";
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
		} catch (Exception e) {
			result = "error";
			System.out.println(e.getMessage());
		}
		String content = request.getParameter("content");
		String productId = request.getParameter("productId");
		if(StringUtils.isNotEmpty(productId) && StringUtils.isNotEmpty(content)){
			List<Map<String, Object>> product = null;
			product = jdbctemplate.queryForList("SELECT * FROM product WHERE PRODUCTID = ?", new Object[]{productId});
			if(product!=null && product.size() > 0){
				List<Map<String, Object>> contents = jdbctemplate.queryForList("SELECT * FROM content WHERE CONTENTID = ? AND CONTENTOPT = 'USED' AND CONTENTTYPE = 'PRDCONTENT'", new Object[]{productId});
				if(contents!=null && contents.size() > 0){
					int conId = ( int) contents.get(0).get("CONID");
					jdbctemplate.update("UPDATE content SET CONTENTOPT = 'OLDED' WHERE CONID = ? AND CONTENTID = ?", new Object[]{ conId, productId});
				}
				jdbctemplate.update("INSERT INTO content(CONTENTID, CONTENT, CONTENTOPT, CONTENTTYPE, CONTENTDATE) VALUES(?,?,'USED','PRDCONTENT', NOW())", new Object[]{ productId, content});
				result = "success";
			}
		}
		try {
			out.print(result);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String add_productdescontent(){
		String productId = request.getParameter("productId");
		if(StringUtils.isNotEmpty(productId)){
			List<Map<String, Object>> product = null;
			product = jdbctemplate.queryForList("SELECT * FROM product WHERE PRODUCTID = ?", new Object[]{productId});
			if(product!=null && product.size() > 0){
				List<Map<String, Object>> productcontents = jdbctemplate.queryForList("SELECT CONTENT FROM content WHERE CONTENTID = ? AND CONTENTOPT = 'USED' AND CONTENTTYPE = 'PRDDESCONTENT'", new Object[]{productId});
				if( productcontents != null && productcontents.size() > 0){
					ServletActionContext.getContext().put("productcontents", productcontents.get(0));
				}else{
					List<Map<String, Object>> contentdemo = jdbctemplate.queryForList("SELECT CONTENT FROM content WHERE CONTENTID = ? AND CONTENTOPT = 'DEMODESCONTENT' AND CONTENTTYPE = 'PRDDESCONTENT'", new Object[]{"DemoProductContent"});
					if( contentdemo != null && contentdemo.size() > 0){
						ServletActionContext.getContext().put("productcontents", contentdemo.get(0));
					}else{
						ServletActionContext.getContext().put("productcontents", "NO CONTENT");
					}
				}
				ServletActionContext.getContext().put("productId", productId);
			}
		}
		return "success";
	}
	
	public String update_productdescontent(){
		PrintWriter out = null;
		String result = "error";
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
		} catch (Exception e) {
			result = "error";
			System.out.println(e.getMessage());
		}
		String content = request.getParameter("content");
		String productId = request.getParameter("productId");
		if(StringUtils.isNotEmpty(productId) && StringUtils.isNotEmpty(content)){
			List<Map<String, Object>> product = null;
			product = jdbctemplate.queryForList("SELECT * FROM product WHERE PRODUCTID = ?", new Object[]{productId});
			if(product!=null && product.size() > 0){
				List<Map<String, Object>> contents = jdbctemplate.queryForList("SELECT * FROM content WHERE CONTENTID = ? AND CONTENTOPT = 'USED' AND CONTENTTYPE = 'PRDDESCONTENT'", new Object[]{productId});
				if(contents!=null && contents.size() > 0){
					int conId = ( int) contents.get(0).get("CONID");
					jdbctemplate.update("UPDATE content SET CONTENTOPT = 'OLDED' WHERE CONID = ? AND CONTENTID = ?", new Object[]{ conId, productId});
				}
				jdbctemplate.update("INSERT INTO content(CONTENTID, CONTENT, CONTENTOPT, CONTENTTYPE, CONTENTDATE) VALUES(?,?,'USED','PRDDESCONTENT', NOW())", new Object[]{ productId, content});
				result = "success";
			}
		}
		try {
			out.print(result);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String update_product(){
		PrintWriter out = null;
		String result = "error";
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
		} catch (Exception e) {
			result = "error";
			System.out.println(e.getMessage());
		}
		 
		String productId = request.getParameter("productId");
		if(StringUtils.isNotEmpty(productId)){
			int count = jdbctemplate.queryForInt("SELECT COUNT(*) FROM product WHERE PRODUCTID = ?",new Object[]{productId});
			String productName = request.getParameter("productName");
			String productCatalog = request.getParameter("productCatalog");
			String productDes = request.getParameter("productDes");
			String productNumber = request.getParameter("productNumber");
			String productshow = request.getParameter("productshow");
			String productshowhead = request.getParameter("productshowhead");
			String productnewimg = request.getParameter("productToid");
			try {
				if(count > 0){
					jdbctemplate.update("UPDATE product SET PRODUCTNAME=?, PRODUCTCATALOG=?, PRODUCTDES=?, PRODUCTNUMBER=?, PRODUCTSHOW=?, PRODUCTSHOWHEAD=?, PRODUCTIMG=? WHERE PRODUCTID=?", new Object[]{productName, productCatalog, productDes, productNumber, productshow, productshowhead, productnewimg, productId});
				}else{
					jdbctemplate.update("INSERT INTO product(PRODUCTID, PRODUCTNAME, PRODUCTCATALOG, PRODUCTDES, PRODUCTNUMBER, PRODUCTSHOW, PRODUCTSHOWHEAD, PRODUCTIMG) VALUES(?,?,?,?,?,?,?,?)", new Object[]{productId, productName, productCatalog, productDes, productNumber, productshow, productshowhead, productnewimg});
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
				result = "error";
			}
			result = "success";
		}
		try {
			out.print(result);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String del_product(){
		PrintWriter out = null;
		String result = "error";
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		String productId = request.getParameter("productId");
		if(StringUtils.isNotEmpty(productId)){
			int productcount = jdbctemplate.queryForInt("SELECT COUNT(*) FROM product WHERE PRODUCTID = ?", new Object[]{productId});
			if(productcount > 0){
				jdbctemplate.update("DELETE FROM product WHERE PRODUCTID = ?", new Object[]{productId});
				result = "success";
			}
		}
		try {
			out.print(result);
			out.flush();
			out.close();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return null;
	}
	
	public String add_news(){
		return "success";
	}
	
	public String upload_propic(){
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		String result = "{msg:'error'}";
		if(productimg!=null){
			try {
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				if(fileName.split("\\.").length > 1){
					int index = fileName.lastIndexOf(".");
			        String imgExtension = fileName.substring(index + 1);
			        String urlpath1 = getFold();
			        String urlpath2 = "/" + getName(fileName);
			        String path = ServletActionContext.getServletContext().getRealPath("/") + "upload/" + urlpath1 ;
					File file = new File(path);
					if(!file.isDirectory()){
						file.mkdirs();
					}
					file = new File(path + urlpath2);
					ImageIO.write( ImageIO.read(productimg), imgExtension, file);
					result = "{msg:'success',url: \"/upload/"+ urlpath1 + urlpath2 +"\"}";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
			out.print(result);
			out.flush();
			out.close();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return null;
	}
	private String getFileExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}
	
	private String getName(String fileName) {
		Random random = new Random();
		return "" + random.nextInt(10000)
				+ System.currentTimeMillis() + this.getFileExt(fileName);
	}
	
	private String getFold(){
		SimpleDateFormat formater = new SimpleDateFormat("yyyyMMdd");
		return formater.format(new Date());
	}
}
