package com.guangde.dao;

import java.util.HashMap;
import java.util.List;

import com.guangde.vo.Content;
import com.guangde.vo.Subject;

public interface SubjectDao {

	public int insertSubject(Subject subject);
	public int insertContent(Content subject);

	public int updateSubject(Subject subject);

	public Subject getSubjectById(String sid);

	public List<Subject> querySubject(HashMap<String, String> params);

}
