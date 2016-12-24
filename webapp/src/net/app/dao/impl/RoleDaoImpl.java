package net.app.dao.impl;

import net.app.dao.RoleDao;
import net.app.entity.Role;

import org.springframework.stereotype.Repository;

/**
 * Dao - 角色
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Repository("roleDaoImpl")
public class RoleDaoImpl extends BaseDaoImpl<Role, Long> implements RoleDao {

}