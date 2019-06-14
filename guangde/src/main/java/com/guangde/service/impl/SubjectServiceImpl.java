package com.guangde.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guangde.dao.SubjectDao;
import com.guangde.dto.ArticleSubDto;
import com.guangde.service.ISubjectService;
import com.guangde.utils.ConstantUtils;
import com.guangde.vo.Content;
import com.guangde.vo.Subject;

@Service
public class SubjectServiceImpl implements ISubjectService {
	private static Logger logger = Logger.getLogger(SubjectServiceImpl.class);

	@Autowired
	private SubjectDao subjectDao;

	//@Autowired
	//private IUserDao userDao;

	@Override
	public boolean insertSubject(Subject subject, Content content) {
		boolean flag = false;
		try {
			// User user = userDao.getUserById(subject.getUserid());
			// 默认帖子状态未结
			subject.setStatus(ConstantUtils.subjectStatus.UNDO);
			int row = subjectDao.insertSubject(subject);
			if (row != 0) {
				content.setSubId(subject.getId());
				subjectDao.insertContent(content);
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("发布失败:" + e);
		}
		return flag;
	}

	@Override
	public boolean updateSubject(Subject subject) {
		boolean flag = false;
		subjectDao.updateSubject(subject);
		return flag;
	}

	@Override
	public Subject getSubjectById(String sid) {
		Subject sub = subjectDao.getSubjectById(sid);
		return sub;
	}

	@Override
	public List<Subject> querySubject(HashMap<String, String> params) {
		List<Subject> list = subjectDao.querySubject(params);
		return list;
	}

	@Override
	public List<ArticleSubDto> queryArticleSubList(HashMap<String, String> params) {
		List<ArticleSubDto> list =subjectDao.queryArticleSubList(params);
		return list;
	}
	
	

}
