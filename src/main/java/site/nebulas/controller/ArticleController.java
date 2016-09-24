package site.nebulas.controller;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import site.nebulas.beans.Article;
import site.nebulas.service.ArticleService;
import site.nebulas.util.DateUtil;

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
		//获得当前用户名
		Subject subject = SecurityUtils.getSubject();
		String userAccount = (String)subject.getPrincipal();
		
		article.setUserAccount(userAccount);
		article.setArticleCreateTime(DateUtil.getTime());
		article.setArticleUpdateTime(DateUtil.getTime());
		articleService.inster(article);
	}
	
	@RequestMapping("articleUpdate")
	@ResponseBody
	public void articleUpdate(Article article){
		article.setArticleUpdateTime(DateUtil.getTime());
		articleService.update(article);
	}
	
	@RequestMapping("articleDelete")
	@ResponseBody
	public void articleDelete(Article article){
		article.setArticleIsDelete(1);
		articleService.update(article);
	}
}