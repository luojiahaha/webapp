package net.app.service.impl;

import javax.annotation.Resource;

import net.app.dao.SnDao;
import net.app.entity.Sn.Type;
import net.app.service.SnService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service - 序列号
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Service("snServiceImpl")
public class SnServiceImpl implements SnService {

	@Resource(name = "snDaoImpl")
	private SnDao snDao;

	@Transactional
	public String generate(Type type) {
		return snDao.generate(type);
	}

}