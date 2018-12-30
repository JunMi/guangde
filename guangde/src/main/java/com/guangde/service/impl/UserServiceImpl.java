package com.guangde.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guangde.dao.IUserDao;
import com.guangde.service.IUserService;
import com.guangde.vo.User;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDao userDao;

	@Override
	public User getUserById(String userid) {
		User user = userDao.getUserById(userid);
		return user;
	}

	@Override
	public int validPass(HashMap<String, String> params) {
		return userDao.validPass(params);
	}

	@Override
	public User getUserLogin(HashMap<String, String> params) {
		User user = userDao.getUserLogin(params);
		return user;
	}

	@Override
	public List<User> queryUserByNickname(String nickName) {
		List<User> list = userDao.queryUserByNickname(nickName);
		return list;
	}

	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public int updatePassword(User user) {
		return userDao.updatePassword(user);
	}

	@Override
	public int deleteUserById(String userid) {
		return userDao.deleteUserById(userid);
	}

	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

}
