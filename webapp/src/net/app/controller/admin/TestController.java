package net.app.controller.admin;

import javax.annotation.Resource;

import net.app.Message;
import net.app.Pageable;
import net.app.entity.Test;
import net.app.service.TestService;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Controller - 管理员
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Controller("adminTestController")
@RequestMapping("/admin/test")
public class TestController extends BaseController {
	private static Logger log = Logger.getLogger(TestController.class);
	@Resource(name = "testServiceImpl")
	private TestService testService;
	

	/**
	 * 检查用户名是否存在
	 */
	@RequestMapping(value = "/check_username", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkUsername(String username) {
		if (StringUtils.isEmpty(username)) {
			return false;
		}
		if (testService.usernameExists(username)) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "/admin/test/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Test test,RedirectAttributes redirectAttributes) {
		test.setUsername(test.getUsername());
		test.setPassword(test.getPassword());
		testService.save(test);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("test", testService.find(id));
		return "/admin/test/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Test test, RedirectAttributes redirectAttributes) {
		if (!isValid(test)) {
			return ERROR_VIEW;
		}
		log.info(test.getUsername());
		testService.update(test);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model) {
		model.addAttribute("page", testService.findPage(pageable));
		return "/admin/test/list";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Message delete(Long[] ids) {
		if (ids.length >= testService.count()) {
			return Message.error("admin.common.deleteAllNotAllowed");
		}
		testService.delete(ids);
		return SUCCESS_MESSAGE;
	}

}