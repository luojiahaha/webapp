package net.app.dao.impl;

import net.app.dao.BrandDao;
import net.app.entity.Brand;

import org.springframework.stereotype.Repository;

/**
 * Dao - 品牌
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Repository("brandDaoImpl")
public class BrandDaoImpl extends BaseDaoImpl<Brand, Long> implements BrandDao {

}