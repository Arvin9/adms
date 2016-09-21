package site.nebulas.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import site.nebulas.beans.Exercises;
import site.nebulas.service.ExercisesService;
import site.nebulas.service.UserService;



@Controller
public class ExercisesController {
	@Resource
	ExercisesService exercisesService;
	
	@RequestMapping("exercises")
	public ModelAndView exercises(){
		ModelAndView model = new ModelAndView("exercises");
		return model;
	}
	
	@RequestMapping("queryByParam")
	@ResponseBody
	public Object queryByParam(Exercises exercises){
		return exercisesService.queryByParam(exercises);
	}
	
}
