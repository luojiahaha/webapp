package net.app.dao.impl;

import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;

import net.app.dao.SeoDao;
import net.app.entity.Seo;
import net.app.entity.Seo.Type;

import org.springframework.stereotype.Repository;

/**
 * Dao - SEO设置
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Repository("seoDaoImpl")
public class SeoDaoImpl extends BaseDaoImpl<Seo, Long> implements SeoDao {

	public Seo find(Type type) {
		if (type == null) {
			return null;
		}
		try {
			String jpql = "select seo from Seo seo where seo.type = :type";
			return entityManager.createQuery(jpql, Seo.class).setFlushMode(FlushModeType.COMMIT).setParameter("type", type).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}