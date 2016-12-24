package net.app.dao.impl;

import net.app.dao.SpecificationDao;
import net.app.entity.Specification;

import org.springframework.stereotype.Repository;

/**
 * Dao - 规格
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Repository("specificationDaoImpl")
public class SpecificationDaoImpl extends BaseDaoImpl<Specification, Long> implements SpecificationDao {

}