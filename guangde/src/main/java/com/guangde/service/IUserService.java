package com.guangde.service;

import com.guangde.vo.User;

public interface IUserService {
	public User getUserById(String userid);

	public int updateUser(User user);

	public int deleteUserById(String userid);

	public int insertUser(User user);

}
