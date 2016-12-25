package net.app.service.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import net.app.service.SearchService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service - 搜索
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Service("searchServiceImpl")
@Transactional
public class SearchServiceImpl implements SearchService {

	/** 模糊查询最小相似度 */
	private static final float FUZZY_QUERY_MINIMUM_SIMILARITY = 0.5F;

	@PersistenceContext
	protected EntityManager entityManager;


	public void index() {
	}

	public void index(Class<?> type) {
	}

	

	public void purge() {
		
	}

	public void purge(Class<?> type) {
	}




}