package com.elink.common;

import javax.servlet.http.HttpSession;

public class UserLogin {

	private String userLoginId=null;
	private String userName=null;
	private String userTye=null; 
	public String getUserLoginId() {
		return userLoginId;
	}
	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserTye() {
		return userTye;
	}
	public void setUserTye(String userTye) {
		this.userTye = userTye;
	}
	public static UserLogin getUser(HttpSession session){
		return (UserLogin)session.getAttribute("userLogin");
	}
}
