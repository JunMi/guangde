package com.guangde.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.guangde.dao.IUserDao;
import com.guangde.utils.BeanUtil;
import com.guangde.utils.ResultUtil;
import com.guangde.vo.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserDao userDao;

	@RequestMapping("/login")
	public ModelAndView login(String param) {
		ModelAndView model = new ModelAndView();
		if ("reg".equals(param)) {
			model.setViewName("client/html/user/reg");
		} else if ("forget".equals(param)) {
			model.setViewName("client/html/user/forget");
		} else {
			model.setViewName("client/html/user/login");
		}
		return model;
	}

	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/home");
		return model;
	}

	@RequestMapping("/set")
	public ModelAndView seting() {
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/set");
		return model;
	}

	@RequestMapping("/message")
	public ModelAndView message() {
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/message");
		return model;
	}

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/index");
		return model;
	}

	@RequestMapping("/activate")
	public ModelAndView activate() {
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/activate");
		return model;
	}

	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public String doLogin(HttpSession session, HttpServletRequest request) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("email", request.getParameter("email"));
		params.put("password", request.getParameter("password"));
		User user = userDao.getUserLogin(params);
		session.setAttribute("user", user);
		if (null != user) {
			// 首页
			return "redirect:/index";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("user");
		return "redirect:/index";
	}

	@RequestMapping("/queryUser")
	@ResponseBody
	public ResultUtil queryUserByNickname(String nickName) {
		if (StringUtils.isEmpty(nickName)) {
			return ResultUtil.fail("参数为空");
		} else {
			List<User> list = userDao.queryUserByNickname(nickName);
			if (CollectionUtils.isEmpty(list)) {
				return ResultUtil.ok(true);
			} else {
				return ResultUtil.ok(false);
			}
		}
	}

	@RequestMapping(value = "/doReg", method = RequestMethod.POST)
	@ResponseBody
	public ResultUtil doReg(HttpSession session, HttpServletRequest request) {
		User user = BeanUtil.getBean(request, User.class);
		int row = userDao.insertUser(user);
		// 注册成功
		if (row != 0) {
			return ResultUtil.ok(true);
		} else {
			return ResultUtil.ok(false);
		}
	}

	@RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public ResultUtil updateUserInfo(HttpSession session, HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		User source = BeanUtil.getBean(request, User.class);
		BeanUtil.copyPropertiesIgnorNull(source, user);
		int row = userDao.updateUser(user);
		if (row != 0) {
			session.setAttribute("user", user);
			return ResultUtil.ok(true);
		} else {
			return ResultUtil.ok(false);
		}
	}

	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	@ResponseBody
	public ResultUtil updatePassword(HttpSession session, HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		String repass = request.getParameter("repass");

		if (!StringUtils.isEmpty(repass) && null != user) {
			user.setPassword(repass);
			userDao.updatePassword(user);
			session.setAttribute("user", user);
			return ResultUtil.ok(true);
		} else {
			return ResultUtil.fail("无效参数");
		}
	}

	@RequestMapping(value = "/validPass", method = RequestMethod.POST)
	@ResponseBody
	public ResultUtil validPass(HttpSession session, HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("userId", user.getUserId());
		params.put("password", request.getParameter("repass"));
		
		int row = userDao.validPass(params);

		return row == 0 ? ResultUtil.fail(false) : ResultUtil.ok(true);
	}
}
