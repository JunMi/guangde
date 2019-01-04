package com.guangde.service;

import java.util.HashMap;
import java.util.List;

import com.guangde.vo.User;

public interface IUserService {
	public User getUserById(String userid);

	public User getUserLogin(String email,String password);

	public List<User> queryUserByNickname(String nickName);

	public int validPass(HashMap<String, String> params);

	public int updateUser(User user);

	public int updatePassword(User user);

	public int deleteUserById(String userid);

	public int insertUser(User user);

}
