package net.app.dao.impl;

import net.app.dao.RefundsDao;
import net.app.entity.Refunds;

import org.springframework.stereotype.Repository;

/**
 * Dao - 退款单
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Repository("refundsDaoImpl")
public class RefundsDaoImpl extends BaseDaoImpl<Refunds, Long> implements RefundsDao {

}