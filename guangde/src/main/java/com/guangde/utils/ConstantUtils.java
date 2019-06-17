package com.guangde.utils;

import java.util.HashMap;

import com.guangde.vo.Subject;

public class ConstantUtils {
	
	//帖子状态
	public static HashMap<String, String> subjectStatus = new HashMap<String, String>();
	//模块分类 
	public static HashMap<String, String> subjectModel = new HashMap<String, String>();
	static{
		//帖子状态
		subjectStatus.put(Subject.STATUS.DEFAULT.getKey(), "默认");
		subjectStatus.put(Subject.STATUS.UNDO.getKey(), "未结");
		subjectStatus.put(Subject.STATUS.DOWN.getKey(), "已结");
		subjectStatus.put(Subject.STATUS.REVIEW.getKey(), "审核中");
		
		//模块分类
		subjectModel.put(Subject.MODULE.SHARE.getKey(), "分享");
		subjectModel.put(Subject.MODULE.DISCUSS.getKey(), "讨论");
		subjectModel.put(Subject.MODULE.QUESTION.getKey(), "提问");
		subjectModel.put(Subject.MODULE.NOTICE.getKey(), "公告");
		subjectModel.put(Subject.MODULE.DYNAMIC.getKey(), "动态");
		subjectModel.put(Subject.MODULE.ADVICE.getKey(), "建议");
	}

}
