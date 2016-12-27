package net.app.service.impl;

import javax.annotation.Resource;

import net.app.dao.PmFundTypeDao;
import net.app.entity.PmFundType;
import net.app.service.PmFundTypeService;

import org.springframework.stereotype.Service;

/**
 * Service - 产品类型
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Service("pmFundTypeServiceImpl")
public class PmFundTypeServiceImpl extends BaseServiceImpl<PmFundType, Long> implements PmFundTypeService {

	@Resource(name = "pmFundTypeDaoImpl")
	private PmFundTypeDao pmFundTypeDao;
	
	@Resource(name = "pmFundTypeDaoImpl")
	public void setBaseDao(PmFundTypeDao pmFundTypeDao) {
		super.setBaseDao(pmFundTypeDao);
	}

	
	


}