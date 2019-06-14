package com.guangde.dao;

import java.util.HashMap;
import java.util.List;

import com.guangde.dto.ArticleSubDto;
import com.guangde.vo.Content;
import com.guangde.vo.Subject;

public interface SubjectDao {

	public int insertSubject(Subject subject);
	public int insertContent(Content subject);

	public int updateSubject(Subject subject);

	public Subject getSubjectById(String sid);

	public List<Subject> querySubject(HashMap<String, String> params);
	/**
	 * 获取文章主题信息
	 * @param params
	 * @return
	 */
	public List<ArticleSubDto> queryArticleSubList(HashMap<String, String> params);
	
}
