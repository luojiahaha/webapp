package net.app.dao.impl;

import java.util.Date;

import javax.persistence.FlushModeType;

import net.app.dao.CartDao;
import net.app.entity.Cart;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Repository;

/**
 * Dao - 购物车
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Repository("cartDaoImpl")
public class CartDaoImpl extends BaseDaoImpl<Cart, Long> implements CartDao {

	public void evictExpired() {
		String jpql = "delete from Cart cart where cart.modifyDate <= :expire";
		entityManager.createQuery(jpql).setFlushMode(FlushModeType.COMMIT).setParameter("expire", DateUtils.addSeconds(new Date(), -Cart.TIMEOUT)).executeUpdate();
	}

}