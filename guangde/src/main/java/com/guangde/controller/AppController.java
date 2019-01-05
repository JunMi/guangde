package com.guangde.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class AppController {

	private static Logger logger = Logger.getLogger(AppController.class);

	@RequestMapping("index")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("client/html/index");

		model.addObject("test", "mjwu");
		model.addObject("date", new SimpleDateFormat("yyyy-mm-dd hh:mm:ss").format(new Date()));
		logger.info("index-->APP应用首页");
		return model;
	}

}
