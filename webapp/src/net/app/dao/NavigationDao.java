package net.app.dao;

import java.util.List;

import net.app.entity.Navigation;
import net.app.entity.Navigation.Position;

/**
 * Dao - 导航
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface NavigationDao extends BaseDao<Navigation, Long> {

	/**
	 * 查找导航
	 * 
	 * @param position
	 *            位置
	 * @return 导航
	 */
	List<Navigation> findList(Position position);

}