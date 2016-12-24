package net.app.job;

import javax.annotation.Resource;

import net.app.service.StaticService;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Job - 静态化
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Component("staticJob")
@Lazy(false)
public class StaticJob {

	@Resource(name = "staticServiceImpl")
	private StaticService staticService;

	/**
	 * 生成静态
	 */
	@Scheduled(cron = "${job.static_build.cron}")
	public void build() {
		staticService.buildAll();
	}

}