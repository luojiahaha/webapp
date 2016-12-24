package net.app.service.impl;

import java.util.List;

import javax.annotation.Resource;

import net.app.Principal;
import net.app.dao.TestDao;
import net.app.entity.Admin;
import net.app.entity.Test;
import net.app.service.TestService;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service - 管理员
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Service("testServiceImpl")
public class TestServiceImpl extends BaseServiceImpl<Test, Long> implements TestService {

	@Resource(name = "testDaoImpl")
	private TestDao testDao;

	@Resource(name = "testDaoImpl")
	public void setBaseDao(TestDao testDao) {
		super.setBaseDao(testDao);
	}

	@Transactional(readOnly = true)
	public boolean usernameExists(String username) {
		return testDao.usernameExists(username);
	}

	@Transactional(readOnly = true)
	public Admin findByUsername(String username) {
		return testDao.findByUsername(username);
	}



	@Transactional(readOnly = true)
	public boolean isAuthenticated() {
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			return subject.isAuthenticated();
		}
		return false;
	}



	@Transactional(readOnly = true)
	public String getCurrentUsername() {
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			Principal principal = (Principal) subject.getPrincipal();
			if (principal != null) {
				return principal.getUsername();
			}
		}
		return null;
	}

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public void save(Test test) {
		super.save(test);
	}

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public Test update(Test test) {
		return super.update(test);
	}

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public Test update(Test test, String... ignoreProperties) {
		return super.update(test, ignoreProperties);
	}

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public void delete(Long id) {
		super.delete(id);
	}

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public void delete(Long... ids) {
		super.delete(ids);
	}

	@Override
	@Transactional
	@CacheEvict(value = "authorization", allEntries = true)
	public void delete(Test test) {
		super.delete(test);
	}

	public List<String> findAuthorities(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Admin getCurrent() {
		// TODO Auto-generated method stub
		return null;
	}

}