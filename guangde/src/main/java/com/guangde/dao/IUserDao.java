package com.guangde.dao;

import java.util.HashMap;
import java.util.List;

import com.guangde.dto.UserInfoDto;
import com.guangde.vo.User;

public interface IUserDao {

	/**
	 * 精确查询用户
	 * 
	 * @param userid
	 * @return
	 */
	public UserInfoDto getUserById(String userid);

	/**
	 * 获取登陆用户
	 * 
	 * @param params
	 * @return
	 */
	public User getUserLogin(HashMap<String, String> params);

	/**
	 * 根据昵称获取用户信息
	 * 
	 * @param nickName
	 * @return
	 */
	public List<User> queryUserByNickname(String nickName);

	public User getUserByEmail(String email);
	/**
	 * 验证密码
	 * 
	 * @param params
	 * @return
	 */
	public int validPass(HashMap<String, String> params);

	/**
	 * 更新用户info
	 * 
	 * @param user
	 * @return
	 */
	public int updateUser(User user);

	/**
	 * 跟新密码
	 * 
	 * @param user
	 * @return
	 */
	public int updatePassword(User user);

	public int deleteUserById(String user_id);

	/**
	 * 注册用户
	 * 
	 * @param user
	 * @return
	 */
	public int insertUser(User user);

}
