package site.nebulas.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import site.nebulas.service.ChartsService;
import site.nebulas.service.UserService;



@Controller
public class PageController {
	@Resource
	UserService userService;
	@Resource
	ChartsService chartsService;
	
	@RequestMapping("login")
	public ModelAndView login(){
		ModelAndView model = new ModelAndView("login");
		return model;
	}
	@RequestMapping("home")
	public ModelAndView home(){
		ModelAndView model = new ModelAndView("home");
		model.addObject("userVisitPageMap", JSON.toJSON(chartsService.queryUserVisitPage()));
		return model;
	}
	
}
