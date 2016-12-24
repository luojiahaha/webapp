package net.app.service;

import java.util.List;

import net.app.LogConfig;

/**
 * Service - 日志配置
 * 
 * @author Luoj Team
 * @version 3.0
 */
public interface LogConfigService {

	/**
	 * 获取所有日志配置
	 * 
	 * @return 所有日志配置
	 */
	List<LogConfig> getAll();

}