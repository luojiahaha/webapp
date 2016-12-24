package net.app.dao.impl;

import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;

import net.app.dao.TestDao;
import net.app.entity.Admin;
import net.app.entity.Test;

import org.springframework.stereotype.Repository;

/**
 * Dao - 管理员
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Repository("testDaoImpl")
public class TestDaoImpl extends BaseDaoImpl<Test, Long> implements TestDao {

	public boolean usernameExists(String username) {
		if (username == null) {
			return false;
		}
		String jpql = "select count(*) from Test test where lower(test.username) = lower(:username)";
		Long count = entityManager.createQuery(jpql, Long.class).setFlushMode(FlushModeType.COMMIT).setParameter("username", username).getSingleResult();
		return count > 0;
	}

	public Admin findByUsername(String username) {
		if (username == null) {
			return null;
		}
		try {
			String jpql = "select admin from Test test where lower(admin.username) = lower(:username)";
			return entityManager.createQuery(jpql, Admin.class).setFlushMode(FlushModeType.COMMIT).setParameter("username", username).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}