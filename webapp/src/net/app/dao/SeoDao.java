package net.app.dao;

import net.app.entity.Seo;
import net.app.entity.Seo.Type;

/**
 * Dao - SEO设置
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface SeoDao extends BaseDao<Seo, Long> {

	/**
	 * 查找SEO设置
	 * 
	 * @param type
	 *            类型
	 * @return SEO设置
	 */
	Seo find(Type type);

}