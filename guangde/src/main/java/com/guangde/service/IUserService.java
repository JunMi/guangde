package com.guangde.service;

import java.util.HashMap;

import com.guangde.vo.User;

public interface IUserService {
	public User getUserById(String userid);
	
	public User getUserLogin(HashMap<String, String> params);
	
	public int updateUser(User user);

	public int deleteUserById(String userid);

	public int insertUser(User user);

}
