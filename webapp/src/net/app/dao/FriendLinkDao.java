package net.app.dao;

import java.util.List;

import net.app.entity.FriendLink;
import net.app.entity.FriendLink.Type;

/**
 * Dao - 友情链接
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface FriendLinkDao extends BaseDao<FriendLink, Long> {

	/**
	 * 查找友情链接
	 * 
	 * @param type
	 *            类型
	 * @return 友情链接
	 */
	List<FriendLink> findList(Type type);

}