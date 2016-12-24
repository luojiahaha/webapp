package net.app.dao;

import net.app.entity.Log;

/**
 * Dao - 日志
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface LogDao extends BaseDao<Log, Long> {

	/**
	 * 删除所有日志
	 */
	void removeAll();

}