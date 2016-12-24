package net.app.dao.impl;

import net.app.dao.ReturnsDao;
import net.app.entity.Returns;

import org.springframework.stereotype.Repository;

/**
 * Dao - 退货单
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Repository("returnsDaoImpl")
public class ReturnsDaoImpl extends BaseDaoImpl<Returns, Long> implements ReturnsDao {

}