package net.app.dao;

import net.app.Page;
import net.app.Pageable;
import net.app.entity.Deposit;
import net.app.entity.Member;

/**
 * Dao - 预存款
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface DepositDao extends BaseDao<Deposit, Long> {

	/**
	 * 查找预存款分页
	 * 
	 * @param member
	 *            会员
	 * @param pageable
	 *            分页信息
	 * @return 预存款分页
	 */
	Page<Deposit> findPage(Member member, Pageable pageable);

}