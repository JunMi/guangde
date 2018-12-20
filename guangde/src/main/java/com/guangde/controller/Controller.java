package com.guangde.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.guangde.service.IUserService;
import com.guangde.vo.User;

@RestController
public class Controller {

	@Autowired
	private IUserService userService;
	
	private static Logger logger = Logger.getLogger(Controller.class);
	
	
	@RequestMapping("index.do")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("index");
		
		model.addObject("test", "mjwu");
		model.addObject("date", new SimpleDateFormat("yyyy-mm-dd hh:mm:ss").format(new Date()));
		logger.info("index-->");
		return model;
	}
	
	@RequestMapping("/getUser.do")
	public User getUser(String userid){
		User user = userService.getUserById(userid);
		logger.info("添加日志-->用户名字："+user.getFullName());
		return user;
	}
	
	@RequestMapping("/updateUser.do")
	public int updateUser(String userid){
		User user = userService.getUserById(userid);
		if(user==null)
			return 0;
		user.setFullName("新名字");
		return userService.updateUser(user);
	}
	
	@RequestMapping("/insertUser.do")
	public int insertUser(String userid){
		User user = new User();
		user.setUserId("ids");
		user.setFullName("新增的用户");
		return userService.insertUser(user);
	}
	
	@RequestMapping("/deleteUserById.do")
	public int deleteUserById(String userid){
		return userService.deleteUserById(userid);
	}
	
}
