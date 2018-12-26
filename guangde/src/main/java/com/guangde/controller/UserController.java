package com.guangde.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.guangde.dao.IUserDao;
import com.guangde.vo.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserDao userDao;
	
	@RequestMapping("/login.do")
	public ModelAndView login(String param){
		ModelAndView model = new ModelAndView();
		if("reg".equals(param)){
			model.setViewName("client/html/user/reg");
		}else if("forget".equals(param)){
			model.setViewName("client/html/user/forget");
		}else{
			model.setViewName("client/html/user/login");
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
	
	@RequestMapping("/doLogin.do")
	public String doLogin(HttpSession session,HttpServletRequest request){
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("email", request.getParameter("email"));
		params.put("pass", request.getParameter("pass"));
		User user = userDao.getUserLogin(params);
		session.setAttribute("user", user);
		if(null!=user){
			//首页
			return "redirect:/index.do";
		}else{
			return "redirect:login.do";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session,HttpServletRequest request){
		session.removeAttribute("user");
		return "redirect:/index.do";
	}
	
	
	
	
}
