package com.guangde.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.guangde.service.IAttachmentService;
import com.guangde.service.IUserService;
import com.guangde.utils.BeanUtil;
import com.guangde.utils.FileUtils;
import com.guangde.utils.ResultUtil;
import com.guangde.vo.Attachment;
import com.guangde.vo.User;

@Controller
@RequestMapping("/user")
public class UserController {

	private static Logger logger = Logger.getLogger(UserController.class);

	@Autowired
	private IUserService userService;
	@Autowired
	private IAttachmentService attachmentService;

	@RequestMapping("/login")
	public ModelAndView login(String param) {
		ModelAndView model = new ModelAndView();
		switch (param) {
		case "reg":
			model.setViewName("client/html/user/reg");
			break;
		case "forget":
			model.setViewName("client/html/user/forget");
			break;
		default:
			model.setViewName("client/html/user/login");
			break;
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
	public ModelAndView seting(HttpSession session) {
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/set");
		model.addObject("nav", "set");
		User user = (User) session.getAttribute("user");
		List<Attachment> attachment = attachmentService.queryAttachment(0, user.getUserId());
		if (!CollectionUtils.isEmpty(attachment)) {
			model.addObject("userPhoto", attachment.get(0).getPath());
		}
		return model;
	}

	@RequestMapping("/message")
	public ModelAndView message() {
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/message");
		model.addObject("nav", "message");
		return model;
	}

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/index");
		model.addObject("nav", "index");
		return model;
	}

	@RequestMapping("/activate")
	public ModelAndView activate() {
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/user/activate");

		return model;
	}

	@RequestMapping(value = "/activateEmail", method = RequestMethod.POST)
	@ResponseBody
	public ResultUtil activateEmail(HttpSession session, HttpServletRequest request) {
		String email = request.getParameter("email");
		User user = userService.getUserByEmail(email);

		boolean flag = userService.activateEmail(user);

		return flag ? ResultUtil.ok(true) : ResultUtil.fail(false);
	}

	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public String doLogin(HttpSession session, HttpServletRequest request) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = userService.getUserLogin(email, password);
		session.setAttribute("user", user);
		if (null != user) {
			List<Attachment> attachment = attachmentService.queryAttachment(0, user.getUserId());
			if (!CollectionUtils.isEmpty(attachment)) {
				session.setAttribute("userPhoto", attachment.get(0).getPath());
			}
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

	/**
	 * 验证昵称
	 */
	@RequestMapping("/validNickName")
	@ResponseBody
	public ResultUtil queryUserByNickname(String nickName) {
		if (StringUtils.isEmpty(nickName)) {
			return ResultUtil.fail("参数为空");
		} else {
			List<User> list = userService.queryUserByNickname(nickName);
			if (CollectionUtils.isEmpty(list)) {
				// 没有nickName的用户，验证成功
				return ResultUtil.ok(true);
			} else {
				return ResultUtil.fail(false);
			}
		}
	}

	@RequestMapping("/validEmail")
	@ResponseBody
	public ResultUtil validEmail(String email) {
		if (StringUtils.isEmpty(email)) {
			return ResultUtil.fail("参数为空");
		} else {
			User user = userService.getUserByEmail(email);
			if (null == user) {
				// 没有email的用户，验证成功
				return ResultUtil.ok(true);
			} else {
				// 已经存在 用户
				return ResultUtil.fail(false);
			}
		}
	}

	/**
	 * 找回密码
	 * 
	 * @param email
	 * @return
	 */
	@RequestMapping("/forgetPassword")
	@ResponseBody
	public ResultUtil forgetPassword(HttpSession session, HttpServletRequest request) {
		String email = request.getParameter("email");
		User user = userService.getUserByEmail(email);
		if (null == user) {
			return ResultUtil.fail("该邮箱信息尚未注册");
		} else {
			boolean flag = userService.forgetPassword(user);
			return flag ? ResultUtil.ok(true) : ResultUtil.fail("网络异常，发送失败");
		}
	}

	@RequestMapping("/getUser/{userid}")
	@ResponseBody
	public ResultUtil getUserById(@PathVariable String userid) {
		if (StringUtils.isEmpty(userid)) {
			return ResultUtil.fail("参数为空");
		} else {
			User user = userService.getUserById(userid);
			if (null != user) {
				return ResultUtil.ok(user);
			} else {
				return ResultUtil.fail("没有相关用户");
			}
		}
	}

	@RequestMapping(value = "/doReg", method = RequestMethod.POST)
	@ResponseBody
	public ResultUtil doReg(HttpSession session, HttpServletRequest request) {
		User user = BeanUtil.getBean(request, User.class);
		int row = userService.insertUser(user);
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
		int row = userService.updateUser(user);
		if (row != 0) {
			session.setAttribute("user", user);
			return ResultUtil.ok(true);
		} else {
			return ResultUtil.fail(false);
		}
	}

	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	@ResponseBody
	public ResultUtil updatePassword(HttpSession session, HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		String repass = request.getParameter("repass");

		if (!StringUtils.isEmpty(repass) && null != user) {
			user.setPassword(repass);
			userService.updatePassword(user);
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

		int row = userService.validPass(params);

		return row == 0 ? ResultUtil.fail(false) : ResultUtil.ok(true);
	}

	@RequestMapping(value = "/uploadPhoto", method = RequestMethod.POST)
	@ResponseBody
	public ResultUtil uploadPhoto(HttpSession session, HttpServletRequest request, MultipartFile file) {
		User user = (User) session.getAttribute("user");
		try {
			if (user != null) {
				Attachment attachment = FileUtils.uploadFile(file, new File(Attachment.userPhotoDir), request);
				attachment.setRelationId(user.getUserId());
				attachment.setType(Attachment.userPhoto);
				attachmentService.deleteAttachment(Attachment.userPhoto, user.getUserId());
				attachmentService.insertAttachment(attachment);
				session.setAttribute("userPhoto", attachment.getPath());
			} else {
				return ResultUtil.fail("用户未登录");
			}
		} catch (IllegalStateException e) {
			// e.printStackTrace();
			logger.error(e.getMessage());
		} catch (IOException e) {
			// e.printStackTrace();
			logger.error(e.getMessage());
		}
		return ResultUtil.ok(true);
	}

}
