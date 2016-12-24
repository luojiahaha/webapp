package net.app.job;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Job - 购物车
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Component("cartJob")
@Lazy(false)
public class CartJob {


	/**
	 * 清除过期购物车
	 */
	@Scheduled(cron = "${job.cart_evict_expired.cron}")
	public void evictExpired() {
	}

}