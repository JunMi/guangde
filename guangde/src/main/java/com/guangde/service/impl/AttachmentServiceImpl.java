package com.guangde.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guangde.dao.IAttachmentDao;
import com.guangde.service.IAttachmentService;
import com.guangde.vo.Attachment;

@Service
public class AttachmentServiceImpl implements IAttachmentService {
	@Autowired
	private IAttachmentDao attachmentDao;

	@Override
	public int insertAttachment(Attachment att) {
		int row = attachmentDao.insertAttachment(att);
		return row;
	}

	@Override
	public int deleteAttachment(int type, String relationId) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("relationId", relationId);
		params.put("type", type);
		int row = attachmentDao.deleteAttachment(params);
		return row;
	}

	@Override
	public List<Attachment> queryAttachment(int type, String relationId) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("relationId", relationId);
		params.put("type", type);
		List<Attachment> attachment = attachmentDao.queryAttachment(params);
		return attachment;
	}

	
}
