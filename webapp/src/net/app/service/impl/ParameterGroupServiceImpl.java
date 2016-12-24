package net.app.service.impl;

import javax.annotation.Resource;

import net.app.dao.ParameterGroupDao;
import net.app.entity.ParameterGroup;
import net.app.service.ParameterGroupService;

import org.springframework.stereotype.Service;

/**
 * Service - 参数组
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Service("parameterGroupServiceImpl")
public class ParameterGroupServiceImpl extends BaseServiceImpl<ParameterGroup, Long> implements ParameterGroupService {

	@Resource(name = "parameterGroupDaoImpl")
	public void setBaseDao(ParameterGroupDao parameterGroupDao) {
		super.setBaseDao(parameterGroupDao);
	}

}