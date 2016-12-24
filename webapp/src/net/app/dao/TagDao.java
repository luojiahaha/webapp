package net.app.dao;

import java.util.List;

import net.app.entity.Tag;
import net.app.entity.Tag.Type;

/**
 * Dao - 标签
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface TagDao extends BaseDao<Tag, Long> {

	/**
	 * 查找标签
	 * 
	 * @param type
	 *            类型
	 * @return 标签
	 */
	List<Tag> findList(Type type);

}