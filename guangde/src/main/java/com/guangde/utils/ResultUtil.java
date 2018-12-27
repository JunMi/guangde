package com.guangde.utils;

public class ResultUtil {

	public static final Integer FAIL_CODE = 1;
	public static final Integer SUCCESS_CODE = 0;
	public static final String FAIL = "fail";
	public static final String SUCCESS = "success";

	private Integer code;// 响应码
	private String msg;// 相应信息
	private boolean flag;
	private Object data;// 相应数据

	public ResultUtil() {
		super();
		this.code = SUCCESS_CODE;
		this.msg = SUCCESS;
		this.flag = true;
	}

	public ResultUtil(Integer code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}

	public ResultUtil(Integer code, String msg, boolean flag, Object data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
		this.flag = flag;
	}

	public static ResultUtil ok(Object data) {
		return new ResultUtil(SUCCESS_CODE, SUCCESS, true, data);
	}

	public static ResultUtil fail(Object data) {
		return new ResultUtil(FAIL_CODE, FAIL, false, data);
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
