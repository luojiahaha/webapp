package net.app;

/**
 * 公共参数
 * 
 * @author Luoj Team
 * @version 3.0
 */
public final class CommonAttributes {

	/** 日期格式配比 */
	public static final String[] DATE_PATTERNS = new String[] { "yyyy", "yyyy-MM", "yyyyMM", "yyyy/MM", "yyyy-MM-dd", "yyyyMMdd", "yyyy/MM/dd", "yyyy-MM-dd HH:mm:ss", "yyyyMMddHHmmss", "yyyy/MM/dd HH:mm:ss" };

	/** webapp.xml文件路径 */
	public static final String WEBAPP_XML_PATH = "/webapp.xml";

	/** webapp.properties文件路径 */
	public static final String WEBAPP_PROPERTIES_PATH = "/webapp.properties";

	/**
	 * 不可实例化
	 */
	private CommonAttributes() {
	}

}