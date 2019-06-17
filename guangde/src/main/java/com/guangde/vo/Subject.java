package com.guangde.vo;

public class Subject {

	private String id;
	private String title;
	/**
	 * 板块-0-提问，99-分享，100-讨论，101-建议，168-公告，169-动态
	 */
	private String module;
	/**
	 * 帖子状态0-默认模块，1-未结，2-已结，3-审核中
	 */
	private String status;
	private int browse;
	private int reply;

	private int integral;// 帖子积分
	private String createdate;
	private String userid;
	private int top;//顶置
	private int fine;//精贴
	
	public enum MODULE {
		//   0-分享，1-讨论，2-提问，3-公告，4-动态，5-建议
		SHARE("0"), DISCUSS("1"), QUESTION("2"),  NOTICE("3"), DYNAMIC("4"),ADVICE("5");
		private String key;

		private MODULE(String key) {
			this.key = key;
		}

		public String getKey() {
			return key;
		}

		public void setKey(String key) {
			this.key = key;
		}
	}

	public enum STATUS {
		// 帖子状态0-默认模块，1-未结，2-已结，3-审核中
		DEFAULT("0"), UNDO("1"), DOWN("2"), REVIEW("3");
		private String key;

		private STATUS(String key) {
			this.key = key;
		}

		public String getKey() {
			return key;
		}

		public void setKey(String key) {
			this.key = key;
		}

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getStatus() {
		System.out.println(STATUS.valueOf(status));
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getBrowse() {
		return browse;
	}

	public void setBrowse(int browse) {
		this.browse = browse;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	public int getIntegral() {
		return integral;
	}

	public void setIntegral(int integral) {
		this.integral = integral;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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
