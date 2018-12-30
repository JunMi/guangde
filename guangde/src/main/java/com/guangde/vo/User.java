package com.guangde.vo;

public class User {

	private String userId;
	private String nickName;
	private String password;
	private String fullName;
	private String email;
	private String mobile;
	/**
	 * 城市
	 */
	private String fromCity;
	/**
	 * 签名
	 */
	private String sign;
	/**
	 * 性别 0-男，1-女
	 */
	private int gender;
	/**
	 * 邮箱是否认证 0-否 1-是
	 */
	private int validateEmail;
	/**
	 * 用户是否认证 0-否 1-是
	 */
	private int validateUser;
	/**
	 * 可用积分
	 */
	private int starts;
	/**
	 * 认证信息
	 */
	private String validateInfo;
	/**
	 * 创建时间
	 */
	private String createdate;
	/**
	 * 是否有效用户0-有效，1-无效
	 */
	private int isEffective;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getFromCity() {
		return fromCity;
	}

	public void setFromCity(String fromCity) {
		this.fromCity = fromCity;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getValidateEmail() {
		return validateEmail;
	}

	public void setValidateEmail(int validateEmail) {
		this.validateEmail = validateEmail;
	}

	public int getValidateUser() {
		return validateUser;
	}

	public void setValidateUser(int validateUser) {
		this.validateUser = validateUser;
	}

	public int getStarts() {
		return starts;
	}

	public void setStarts(int starts) {
		this.starts = starts;
	}

	public String getValidateInfo() {
		return validateInfo;
	}

	public void setValidateInfo(String validateInfo) {
		this.validateInfo = validateInfo;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public int getIsEffective() {
		return isEffective;
	}

	public void setIsEffective(int isEffective) {
		this.isEffective = isEffective;
	}

}
