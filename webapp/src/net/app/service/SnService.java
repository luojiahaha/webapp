package net.app.service;

import net.app.entity.Sn.Type;

/**
 * Service - 序列号
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface SnService {

	/**
	 * 生成序列号
	 * 
	 * @param type
	 *            类型
	 * @return 序列号
	 */
	String generate(Type type);

}