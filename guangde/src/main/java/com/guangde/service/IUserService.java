package com.guangde.service;

import java.util.HashMap;
import java.util.List;

import com.guangde.vo.User;

public interface IUserService {
	public User getUserById(String userid);
	
	public User getUserLogin(HashMap<String, String> params);
	
	public List<User> queryUserByNickname(String nickName);
	
	public int updateUser(User user);

	public int deleteUserById(String userid);

	public int insertUser(User user);

}
