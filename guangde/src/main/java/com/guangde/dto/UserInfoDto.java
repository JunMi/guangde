package com.guangde.dto;

import com.guangde.vo.User;

public class UserInfoDto extends User{

	private String photoPath;

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	
}
