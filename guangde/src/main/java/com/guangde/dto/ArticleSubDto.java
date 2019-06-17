package com.guangde.dto;

import com.guangde.utils.ConstantUtils;

/**
 * 文章标题dto
 * 
 * @author wumj
 *
 */
public class ArticleSubDto {

	private String title;
	/**
	 * 模块分类  0-分享，1-讨论，2-提问，3-公告，4-动态，5-建议
	 */
	private String module;
	/**
	 * 状态 0-默认模块，1-未结，2-已结，3-审核中，4-顶置，5-精贴
	 */
	private String status;
	private String reply;
	private String integral;
	private String createDate;
	private String userId;
	private String nickName;
	private String photoPath;
	/**
	 * 认证信息
	 */
	private String validateInfo;
	private int top;
	private int fine;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getModule() {
		return ConstantUtils.subjectModel.get(module);
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getStatus() {
		return ConstantUtils.subjectStatus.get(status);
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getIntegral() {
		return integral;
	}
	public void setIntegral(String integral) {
		this.integral = integral;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
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
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public String getValidateInfo() {
		return validateInfo;
	}
	public void setValidateInfo(String validateInfo) {
		this.validateInfo = validateInfo;
	}
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}
	public int getFine() {
		return fine;
	}
	public void setFine(int fine) {
		this.fine = fine;
	}

}
