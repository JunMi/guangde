package com.guangde.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.guangde.service.ISubjectService;
import com.guangde.utils.BeanUtil;
import com.guangde.utils.ResultUtil;
import com.guangde.vo.Content;
import com.guangde.vo.Subject;

@RestController
@RequestMapping("/article")
public class ArticleController {

	private static Logger logger = Logger.getLogger(ArticleController.class);

	@Autowired
	private ISubjectService subjectService;
	
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/jie/index");
		return model;
	}

	@RequestMapping("/add")
	public ModelAndView add() {
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/jie/add");
		return model;
	}

	@RequestMapping("/detail")
	public ModelAndView detail() {
		ModelAndView model = new ModelAndView();
		model.setViewName("client/html/jie/detail");
		return model;
	}
	
	/**
	 * 新增，修改发布文章
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateArticle")
	public ResultUtil updateArticle( HttpServletRequest request){
		String userid = request.getParameter("userid");
		if(StringUtils.isEmpty(userid)){
			logger.info("用户未登陆,发帖失败！");
			return new ResultUtil(ResultUtil.FAIL_CODE, "用户未登陆", false, null);
		}
		Subject sub = BeanUtil.getBean(request, Subject.class);
		Content content = BeanUtil.getBean(request, Content.class);
		boolean flag = subjectService.insertSubject(sub,content);
		// 成功
		if (flag) {
			return ResultUtil.ok("发布成功！");
		} else {
			return ResultUtil.fail("发布失败，请重试");
		}
	}

}
