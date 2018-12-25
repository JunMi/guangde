package com.guangde.dao;

import java.util.HashMap;

import com.guangde.vo.User;

public interface IUserDao {

	public User getUserById(String userid);

	public User getUserLogin(HashMap<String, String> params);
	
	public int updateUser(User user);

	public int deleteUserById(String user_id);
	
	public int insertUser(User user);
	
	
}
