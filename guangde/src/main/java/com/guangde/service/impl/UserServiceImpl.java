package com.guangde.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guangde.dao.IUserDao;
import com.guangde.service.IUserService;
import com.guangde.utils.EmailUtil;
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
	public User getUserLogin(String email, String password) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("email", email);
		params.put("password", password);
		User user = userDao.getUserLogin(params);
		return user;
	}

	@Override
	public User getUserByEmail(String email) {
		User user = userDao.getUserByEmail(email);
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

	@Override
	public boolean activateEmail(User user) {
		String subject = "V社区激活邮件"; 
		String content = "亲爱的 "+user.getNickName()+"用户：<br/>"
				+"您好！<br/>"
				+"您于"+new SimpleDateFormat("yyyy年MM月dd日  HH:mm:ss").format(new Date())+"在V社区激活邮箱，"
				+ "请点击<a href='http://www.baidu.com/'>免费激活</a>，以激活您的邮箱。<br/>"
				+"这是一封激活测试邮件！<br/>"
				+ "如非本人操作，请忽略。<br/>"
				+ "<hr/>感谢您注册V社区！ 本邮件由系统自动发出，请勿回复。​";
		
		return EmailUtil.sendEmail(user.getEmail(), subject, content);
	}

	@Override
	public boolean forgetPassword(User user) {
		String subject = "V社区找回密码";
		String content = "亲爱的 "+user.getNickName()+"用户：<br/>"
				+"您好！<br/>"
				+"您于"+new SimpleDateFormat("yyyy年MM月dd日  HH:mm:ss").format(new Date())+" 在V社区通过邮箱找回密码， 您的密码如下：<br/>"
				+ user.getPassword()+"<br/>"
				+ "如非本人操作，请及时修改密码。<br/>"
				+ "<hr/>感谢您注册V社区！ 本邮件由系统自动发出，请勿回复。​";
		return EmailUtil.sendEmail(user.getEmail(), subject, content);
	}

}
