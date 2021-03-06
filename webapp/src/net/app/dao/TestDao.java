package net.app.dao;

import net.app.entity.Admin;
import net.app.entity.Test;

/**
 * Dao - 管理员
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface TestDao extends BaseDao<Test, Long> {

	/**
	 * 判断用户名是否存在
	 * 
	 * @param username
	 *            用户名(忽略大小写)
	 * @return 用户名是否存在
	 */
	boolean usernameExists(String username);

	/**
	 * 根据用户名查找管理员
	 * 
	 * @param username
	 *            用户名(忽略大小写)
	 * @return 管理员，若不存在则返回null
	 */
	Admin findByUsername(String username);

}