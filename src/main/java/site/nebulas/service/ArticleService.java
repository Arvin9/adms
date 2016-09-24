package site.nebulas.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import site.nebulas.beans.Article;
import site.nebulas.dao.ArticleDao;

@Service
public class ArticleService {
	@Resource
	private ArticleDao articleDao;

    public List<Article> queryByParam(Article article){
    	return articleDao.queryByParam(article);
    }
	
    public void inster(Article article){
    	articleDao.inster(article);
    }
    
    public void update(Article article){
    	articleDao.update(article);
    }
    
    public void delete(Article article){
    	articleDao.delete(article);
    }
   
}


