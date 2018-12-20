package com.guangde.dao;

import com.guangde.vo.User;

public interface IUserDao {

	public User getUserById(String userid);

	public int updateUser(User user);

	public int deleteUserById(String user_id);
	
	public int insertUser(User user);
	
	
}
