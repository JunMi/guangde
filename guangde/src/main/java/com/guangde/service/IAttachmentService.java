package com.guangde.service;

import java.util.List;

import com.guangde.vo.Attachment;

public interface IAttachmentService {
	public int insertAttachment(Attachment att);
	public int deleteAttachment(int type, String relationId);

	public List<Attachment> queryAttachment(int type, String relationId);
}
