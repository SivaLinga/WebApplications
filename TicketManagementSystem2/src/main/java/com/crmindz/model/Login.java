package com.crmindz.model;

public class Login {
	
	private String email;
	private String password;
	private String userType;
	private String loginId;
	
	@Override
	public String toString() {
		return "Login [email=" + email + ", password=" + password + ", userType=" + userType + ", loginId=" + loginId
				+ "]";
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
}
