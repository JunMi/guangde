package com.guangde.service;

import java.util.HashMap;
import java.util.List;

import com.guangde.dto.ArticleSubDto;
import com.guangde.vo.Content;
import com.guangde.vo.Subject;

public interface ISubjectService {

	public boolean insertSubject(Subject subject,Content content);

	public boolean updateSubject(Subject subject);

	public Subject getSubjectById(String sid);

	public List<Subject> querySubject(HashMap<String, String> params);
	
	public List<ArticleSubDto> queryArticleSubList(HashMap<String, String> params);
	
}
