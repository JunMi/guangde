package com.guangde.dao;

import java.util.HashMap;
import java.util.List;

import com.guangde.vo.User;

public interface IUserDao {

	public User getUserById(String userid);

	public User getUserLogin(HashMap<String, String> params);
	
	/**
	 * 根据昵称获取用户信息
	 * @param nickName
	 * @return
	 */
	public List<User> queryUserByNickname(String nickName);
	
	public int validPass(HashMap<String, String> params);
	
	public int updateUser(User user);

	public int updatePassword(User user);

	public int deleteUserById(String user_id);
	
	public int insertUser(User user);
	
	
}
