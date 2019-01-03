package com.guangde.dao;

import java.util.HashMap;
import java.util.List;

import com.guangde.vo.Attachment;

public interface IAttachmentDao {

	public int insertAttachment(Attachment att);
	
	public int deleteAttachment(HashMap<String, Object> params);

	public List<Attachment> queryAttachment(HashMap<String, Object> params);
}
