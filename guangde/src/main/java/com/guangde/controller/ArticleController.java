package com.guangde.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/article")
public class ArticleController {

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
	
	

}
