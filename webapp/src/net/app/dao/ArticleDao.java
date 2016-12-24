package net.app.dao;

import java.util.Date;
import java.util.List;

import net.app.Filter;
import net.app.Order;
import net.app.Page;
import net.app.Pageable;
import net.app.entity.Article;
import net.app.entity.ArticleCategory;
import net.app.entity.Tag;

/**
 * Dao - 文章
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface ArticleDao extends BaseDao<Article, Long> {

	/**
	 * 查找文章
	 * 
	 * @param articleCategory
	 *            文章分类
	 * @param tags
	 *            标签
	 * @param count
	 *            数量
	 * @param filters
	 *            筛选
	 * @param orders
	 *            排序
	 * @return 文章
	 */
	List<Article> findList(ArticleCategory articleCategory, List<Tag> tags, Integer count, List<Filter> filters, List<Order> orders);

	/**
	 * 查找文章
	 * 
	 * @param articleCategory
	 *            文章分类
	 * @param beginDate
	 *            起始日期
	 * @param endDate
	 *            结束日期
	 * @param first
	 *            起始记录
	 * @param count
	 *            数量
	 * @return 文章
	 */
	List<Article> findList(ArticleCategory articleCategory, Date beginDate, Date endDate, Integer first, Integer count);

	/**
	 * 查找文章分页
	 * 
	 * @param articleCategory
	 *            文章分类
	 * @param tags
	 *            标签
	 * @param pageable
	 *            分页信息
	 * @return 文章分页
	 */
	Page<Article> findPage(ArticleCategory articleCategory, List<Tag> tags, Pageable pageable);

}