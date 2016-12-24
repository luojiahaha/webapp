package net.app.service;

import net.app.entity.Log;

/**
 * Service - 日志
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface LogService extends BaseService<Log, Long> {

	/**
	 * 清空日志
	 */
	void clear();

}