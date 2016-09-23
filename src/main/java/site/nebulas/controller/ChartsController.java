package site.nebulas.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import site.nebulas.service.ChartsService;

@Controller
public class ChartsController {
	@Resource
	ChartsService chartsService;
	
	/**
	 * 用户访问页面数据量
	 * */
	@RequestMapping("queryUserVisitPage")
	@ResponseBody
	public Object exercisesQueryByParam(){
		return chartsService.queryUserVisitPage();
	}
	
	
}
