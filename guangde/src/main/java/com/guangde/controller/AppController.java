package com.guangde.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.guangde.dto.ArticleSubDto;
import com.guangde.service.ISubjectService;

@RestController
public class AppController {

	private static Logger logger = Logger.getLogger(AppController.class);

	//@Autowired
	//private ISubjectService subjectService;
	
	@RequestMapping("index")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("client/html/index");

		model.addObject("test", "mjwu");
		model.addObject("date", new SimpleDateFormat("yyyy-mm-dd HH:mm:ss").format(new Date()));
		logger.info("index-->APP应用首页");
		// 获取首页置顶的数据
		//HashMap<String, String> params = new HashMap<String, String>();
		//List<ArticleSubDto> articleList = subjectService.queryArticleSubList(params);
		//model.addObject("articleList", articleList);

		return model;
	}

}
