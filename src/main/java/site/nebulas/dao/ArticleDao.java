package site.nebulas.dao;

import java.util.List;

import site.nebulas.beans.Article;

/**
 * @author Honghui
 * @date 20160924
 */
public interface ArticleDao {

	public List<Article> queryByParam(Article article);
	
    public void inster(Article article);
    
    public void update(Article article);
    
    public void delete(Article article);

}

