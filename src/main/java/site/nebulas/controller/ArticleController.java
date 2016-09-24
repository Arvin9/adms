package site.nebulas.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import site.nebulas.beans.Article;
import site.nebulas.service.ArticleService;

@Controller
public class ArticleController {
	@Resource
	ArticleService articleService;
	
	@RequestMapping("article")
	public ModelAndView article(){
		ModelAndView model = new ModelAndView("article");
		return model;
	}
	
	@RequestMapping("articleQueryByParam")
	@ResponseBody
	public Object articleQueryByParam(Article article){
		return articleService.queryByParam(article);
	}
	
	@RequestMapping("articleInsert")
	@ResponseBody
	public void articleInsert(Article article){
		articleService.inster(article);
	}
	
	@RequestMapping("articleUpdate")
	@ResponseBody
	public void articleUpdate(Article article){
		articleService.update(article);
	}
	
	@RequestMapping("articleDelete")
	@ResponseBody
	public void articleDelete(Article article){
		articleService.delete(article);
	}
}
