package site.nebulas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {
	@RequestMapping("login")
	public ModelAndView login(){
		ModelAndView model = new ModelAndView("login");
		return model;
	}
	@RequestMapping("home")
	public ModelAndView home(){
		ModelAndView model = new ModelAndView("home");
		return model;
	}
}
