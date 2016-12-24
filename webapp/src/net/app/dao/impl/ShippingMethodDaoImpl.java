package net.app.dao.impl;

import net.app.dao.ShippingMethodDao;
import net.app.entity.ShippingMethod;

import org.springframework.stereotype.Repository;

/**
 * Dao - 配送方式
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Repository("shippingMethodDaoImpl")
public class ShippingMethodDaoImpl extends BaseDaoImpl<ShippingMethod, Long> implements ShippingMethodDao {

}