package com.guangde.vo;

public class Attachment {

	public static final int userPhoto = 0;
	public static final String userPhotoDir = "photo";
	
	private String id;
	private String relationId;// 关联id
	private Integer type;// 保存类型，0-用户图像
	private String path;// 文件路径
	private String fileType;// 文件类型
	private String fileName;// 文件名称

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRelationId() {
		return relationId;
	}

	public void setRelationId(String relationId) {
		this.relationId = relationId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
