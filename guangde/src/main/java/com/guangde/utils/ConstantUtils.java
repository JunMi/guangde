package com.guangde.utils;

import java.util.HashMap;

public class ConstantUtils {
	
	//帖子状态
	static HashMap<String, String> subjectStatus = new HashMap<String, String>();
	//模块分类 
	static HashMap<String, String> subjectModel = new HashMap<String, String>();
	static{
		subjectStatus.put("1", "未结");
		subjectStatus.put("2", "已结");
		subjectStatus.put("3", "审核中");
		subjectStatus.put("4", "顶置");
		subjectStatus.put("5", "精贴");
		
		subjectModel.put("0", "分享");
		subjectModel.put("1", "讨论");
		subjectModel.put("2", "提问");
		subjectModel.put("3", "公告");
		subjectModel.put("4", "动态");
		subjectModel.put("5", "建议");
	}

}
