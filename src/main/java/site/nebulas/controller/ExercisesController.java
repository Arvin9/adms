package site.nebulas.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.beans.Exercises;
import site.nebulas.service.ExercisesService;

@Controller
public class ExercisesController {
	@Resource
	ExercisesService exercisesService;
	
	@RequestMapping("exercises")
	public ModelAndView exercises(){
		ModelAndView model = new ModelAndView("exercises");
		return model;
	}
	
	@RequestMapping("exercisesQueryByParam")
	@ResponseBody
	public Object exercisesQueryByParam(Exercises exercises){
		return exercisesService.queryByParam(exercises);
	}
	
	@RequestMapping("exercisesInsert")
	@ResponseBody
	public void exercisesInsert(Exercises exercises){
		System.out.println(exercises.getExercisesContent());
		exercisesService.inster(exercises);
	}
	
	@RequestMapping("exercisesUpdate")
	@ResponseBody
	public void exercisesUpdate(Exercises exercises){
		exercisesService.update(exercises);
	}
	
	@RequestMapping("exercisesDelete")
	@ResponseBody
	public void exercisesDelete(Exercises exercises){
		exercisesService.delete(exercises);
	}
}
