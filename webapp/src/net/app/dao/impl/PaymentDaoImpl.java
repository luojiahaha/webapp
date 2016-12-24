package net.app.dao.impl;

import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;

import net.app.dao.PaymentDao;
import net.app.entity.Payment;

import org.springframework.stereotype.Repository;

/**
 * Dao - 收款单
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Repository("paymentDaoImpl")
public class PaymentDaoImpl extends BaseDaoImpl<Payment, Long> implements PaymentDao {

	public Payment findBySn(String sn) {
		if (sn == null) {
			return null;
		}
		String jpql = "select payment from Payment payment where lower(payment.sn) = lower(:sn)";
		try {
			return entityManager.createQuery(jpql, Payment.class).setFlushMode(FlushModeType.COMMIT).setParameter("sn", sn).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}