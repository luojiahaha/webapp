package net.app.dao.impl;

import java.util.List;

import javax.persistence.FlushModeType;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import net.app.dao.FriendLinkDao;
import net.app.entity.FriendLink;
import net.app.entity.FriendLink.Type;

import org.springframework.stereotype.Repository;

/**
 * Dao - 友情链接
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Repository("friendLinkDaoImpl")
public class FriendLinkDaoImpl extends BaseDaoImpl<FriendLink, Long> implements FriendLinkDao {

	public List<FriendLink> findList(Type type) {
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<FriendLink> criteriaQuery = criteriaBuilder.createQuery(FriendLink.class);
		Root<FriendLink> root = criteriaQuery.from(FriendLink.class);
		criteriaQuery.select(root);
		if (type != null) {
			criteriaQuery.where(criteriaBuilder.equal(root.get("type"), type));
		}
		criteriaQuery.orderBy(criteriaBuilder.asc(root.get("order")));
		return entityManager.createQuery(criteriaQuery).setFlushMode(FlushModeType.COMMIT).getResultList();
	}

}