package com.guangde.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping("/login.do")
	public ModelAndView login(String param){
		ModelAndView model = new ModelAndView();
		if("login".equals(param)){
			model.setViewName("client/html/user/login");
		}else if("reg".equals(param)){
			model.setViewName("client/html/user/reg");
		}else if("forget".equals(param)){
			model.setViewName("client/html/user/forget");
		}
		return model;
	}
	
	@RequestMapping("/home.do")
	public ModelAndView home(){
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/home");
		return model;
	}
	
	@RequestMapping("/set.do")
	public ModelAndView seting(){
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/set");
		return model;
	}
	
	@RequestMapping("/message.do")
	public ModelAndView message(){
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/message");
		return model;
	}
	
	@RequestMapping("/index.do")
	public ModelAndView index(){
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/index");
		return model;
	}
	
	@RequestMapping("/activate.do")
	public ModelAndView activate(){
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/activate");
		return model;
	}
	
	
}
