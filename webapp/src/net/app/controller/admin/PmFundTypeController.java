package net.app.controller.admin;

import javax.annotation.Resource;

import net.app.Message;
import net.app.Pageable;
import net.app.entity.PmFundType;
import net.app.service.PmFundTypeService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Controller - 产品类型
 * 
 * @author Luoj Team
 * @version 3.0
 */
@Controller("adminPmFundTypeController")
@RequestMapping("/admin/pmFundType")
public class PmFundTypeController extends BaseController {
	private static Logger log = Logger.getLogger(PmFundTypeController.class);
	@Resource(name = "pmFundTypeServiceImpl")
	private PmFundTypeService pmFundTypeService;
	


	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "/admin/pmFundType/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(PmFundType pmFundType,RedirectAttributes redirectAttributes) {
		pmFundType.setFundTypeName(pmFundType.getFundTypeName());
		pmFundType.setFundTypeState(pmFundType.getFundTypeState());
		pmFundType.setRemark(pmFundType.getRemark());
		pmFundTypeService.save(pmFundType);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("pmFundType", pmFundTypeService.find(id));
		return "/admin/pmFundType/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(PmFundType pmFundType, RedirectAttributes redirectAttributes) {
		if (!isValid(pmFundType)) {
			return ERROR_VIEW;
		}
		pmFundTypeService.update(pmFundType);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model) {
		model.addAttribute("page", pmFundTypeService.findPage(pageable));
		return "/admin/pmFundType/list";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Message delete(Long[] ids) {
		if (ids.length >= pmFundTypeService.count()) {
			return Message.error("admin.common.deleteAllNotAllowed");
		}
		pmFundTypeService.delete(ids);
		return SUCCESS_MESSAGE;
	}

}