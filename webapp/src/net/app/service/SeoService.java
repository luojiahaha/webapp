package net.app.service;

import net.app.entity.Seo;
import net.app.entity.Seo.Type;

/**
 * Service - SEO设置
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface SeoService extends BaseService<Seo, Long> {

	/**
	 * 查找SEO设置
	 * 
	 * @param type
	 *            类型
	 * @return SEO设置
	 */
	Seo find(Type type);

	/**
	 * 查找SEO设置(缓存)
	 * 
	 * @param type
	 *            类型
	 * @param cacheRegion
	 *            缓存区域
	 * @return SEO设置(缓存)
	 */
	Seo find(Type type, String cacheRegion);

}