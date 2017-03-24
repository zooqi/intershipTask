package org.mjyung.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mjyung.entity.Depart;
import org.mjyung.entity.DepartFiliation;
import org.mjyung.service.DepartFiliationService;
import org.mjyung.service.DepartService;
import org.mjyung.service.UserService;
import org.mjyung.util.IDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * depart控制器
 * 
 * @author mjyung
 * @since 2017.03.13
 */
@Controller
public class DepartController {

	@Resource(name = "departService")
	DepartService departService;

	@Resource(name = "userService")
	UserService userService;

	@Resource(name = "departFiliationService")
	DepartFiliationService departFiliationService;

	/**
	 * 获得一个判断是否是部门还是用户的参数(前端已判断)，并跳转到相应的页面
	 * 
	 * @param departId
	 *            部门的唯一标识
	 * @param isParent
	 *            是部门还是用户
	 * @param request
	 *            请求
	 * @param response
	 *            响应
	 * @return 返回需要跳转的页面
	 */
	@RequestMapping("/getDepartId")
	public String getDepartId(String departId, HttpServletRequest request,
			HttpServletResponse response) {

		Depart depart = departService.getDepart(departId);
		request.setAttribute("departAbbreviation",
				depart.getDepartAbbreviation());
		request.setAttribute("departBeforeName", depart.getDepartBeforeName());
		request.setAttribute("departCommisionOffic",
				depart.getDepartCommisionOffic());
		request.setAttribute("", depart.getDepartEnable());
		request.setAttribute("departId", departId);
		return "depart";
	}

	/**
	 * 根据参数删除记录
	 * 
	 * @param departId
	 *            部门的唯一标识
	 */
	@RequestMapping("deleteDepart")
	public String deleteDepart(String departId) {
		// 把部门删除
		departService.deleteDepart(departId);
		// 把部门下的人删除
		userService.deleteUser(departId);
		// 把部门与子部门之间的关系删除
		departFiliationService.deleteDepartFiliation(departId);
		return "tree";
	}

	/**
	 * 增加部门
	 * 
	 * @param departId
	 *            部门唯一标识
	 * @param departAbbreviation
	 *            部门简称
	 * @param departBeforeName
	 *            部门曾用名
	 * @param departCommisionOffic
	 *            是否为执法办
	 * @param departEnable
	 *            是否启动
	 * @return
	 */
	@RequestMapping("/addDepart")
	public String addDepart(String departId, String departAbbreviation,
			String departBeforeName, String departCommisionOffic,
			String departEnable) {
		/**
		 * 自动生成departId
		 */
		IDUtils idUtils = new IDUtils();
		String id = idUtils.generateID();

		/**
		 * 添加部门
		 */
		Depart depart = new Depart();
		depart.setDepartAbbreviation(departAbbreviation);
		depart.setDepartId(id);
		depart.setDepartBeforeName(departBeforeName);
		Boolean a;
		if (departCommisionOffic.equals("是")) {
			a = true;
		} else {
			a = false;
		}
		depart.setDepartCommisionOffic(a);
		departService.addDepart(depart);

		/**
		 * 添加部门和子部门之间的关系
		 */
		DepartFiliation departFiliation = new DepartFiliation();
		departFiliation.setDepartId(departId);
		departFiliation.setSubDepartId(id);
		departFiliationService.addDepartFiliation(departFiliation);

		return "tree";
	}

	/**
	 * 更新部门信息
	 * 
	 * @param departId
	 *            部门唯一标识
	 * @param departAbbreviation
	 *            部门简称
	 * @param departBeforeName
	 *            部门曾用名
	 * @param departCommisionOffic
	 *            是否为执法办
	 * @param departEnable
	 *            是否启动
	 * @return 部门对象
	 */
	@RequestMapping("/updateDepart")
	public String updateDepart(String departId1, String departAbbreviation1,
			String departBeforeName1, Boolean departCommisionOffic1,
			Boolean departEnable1) {
		departService.updateDepart(departId1, departAbbreviation1,
				departBeforeName1, departCommisionOffic1, departEnable1);
		return "tree";
	}
}
