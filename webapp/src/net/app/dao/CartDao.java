package net.app.dao;

import net.app.entity.Cart;

/**
 * Dao - 购物车
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface CartDao extends BaseDao<Cart, Long> {

	/**
	 * 清除过期购物车
	 */
	void evictExpired();

}