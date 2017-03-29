package org.mjyung.controller;

import org.mjyung.entity.Depart;
import org.mjyung.entity.DepartFiliation;
import org.mjyung.service.DepartFiliationService;
import org.mjyung.service.DepartService;
import org.mjyung.service.UserService;
import org.mjyung.util.IDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;

/**
 * depart控制器
 *
 * @author mjyung
 * @since 2017.03.13
 */
@Controller
public class DepartController {

	@Resource(name = "departService")
	private DepartService departService;

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "departFiliationService")
	private DepartFiliationService departFiliationService;

	/**
	 * 跳转到depart.jsp
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

		request.setAttribute("depart", depart);

		return "depart";
	}

	/**
	 * 删除部门
	 *
	 * @param departId
	 *            部门的唯一标识
	 */
	@RequestMapping("deleteDepart")
	public void deleteDepart(HttpServletResponse response, Writer writer,
			@RequestParam(value = "departId", required = true) String departId)
			throws IOException {
		response.setContentType("application/json;charset=UTF-8");

		departService.deleteDepart(departId);
		writer.write("{\"success\":true}");
	}

	/**
	 * 添加部门
	 *
	 * @param departId
	 *            父部门departId
	 * @param departAbbreviation
	 *            部门简称
	 * @param departBeforeName
	 *            部门曾用名
	 * @param departCommisionOffic
	 *            是否为执法办
	 * @param departEnable
	 *            是否启动
	 * @throws IOException
	 *             异常
	 */
	@RequestMapping("/addDepart")
	public void addDepart(HttpServletResponse response, Writer writer,
			@RequestParam(value = "departId", required = true) String departId,
			String departAbbreviation, String departBeforeName,
			String departCommisionOffic, String departEnable,
			String departDelete, String departChineseName, String departMain,
			String departArrayNumber) throws IOException {
		response.setContentType("application/json;charset=UTF-8");

		// 自动生成departId
		String id = IDUtils.generateID();

		// 添加部门
		Depart depart = new Depart();
		depart.setDepartId(id);
		depart.setDepartAbbreviation(departAbbreviation);
		depart.setDepartBeforeName(departBeforeName);
		Boolean a;
		if ("true".equals(departCommisionOffic)) {
			a = true;
		} else {
			a = false;
		}
		depart.setDepartCommisionOffic(a);
		Boolean b;
		if ("true".equals(departEnable)) {
			b = true;
		} else {
			b = false;
		}
		depart.setDepartEnable(b);
		Boolean c;
		if ("true".equals(departDelete)) {
			c = true;
		} else {
			c = false;
		}
		depart.setDepartDelete(c);
		Boolean d;
		if ("true".equals(departMain)) {
			d = true;
		} else {
			d = false;
		}
		depart.setDepartDelete(d);
		depart.setDepartArrayNumber(departArrayNumber);
		depart.setDepartChineseName(departChineseName);
		departService.addDepart(depart);

		/**
		 * 添加部门和子部门之间的关系
		 */
		DepartFiliation departFiliation = new DepartFiliation();

		departFiliation.setDepartId(departId);
		departFiliation.setSubDepartId(id);

		departFiliationService.register(departFiliation);

		writer.write("{\"success\":true}");
	}

	/**
	 * 更新部门信息
	 * 
	 * @param departId1
	 *            部门唯一标识
	 * @param departAbbreviation1
	 *            部门简称
	 * @param departBeforeName1
	 *            部门曾用名
	 * @param departCommisionOffic1
	 *            是否为委员办
	 * @param departEnable1
	 *            是否启动
	 * @throws IOException
	 *             异常
	 */
	@RequestMapping("/updateDepart")
	public void updateDepart(
			HttpServletResponse response,
			Writer writer,
			@RequestParam(value = "departId1", required = true) String departId1,
			String departAbbreviation1, String departBeforeName1,
			String departCommisionOffic1, String departEnable1,
			String departMain1, String departDelete1,
			String departArrayNumber1, String departChineseName1)
			throws IOException {
		response.setContentType("application/json;charset=UTF-8");

		Boolean a;
		if ("true".equals(departCommisionOffic1)) {
			a = true;
		} else {
			a = false;
		}
		Boolean b;
		if ("true".equals(departEnable1)) {
			b = true;
		} else {
			b = false;
		}
		Boolean c;
		if ("true".equals(departDelete1)) {
			c = true;
		} else {
			c = false;
		}
		Boolean d;
		if ("true".equals(departMain1)) {
			d = true;
		} else {
			d = false;
		}

		departService.updateDepart(departId1, departAbbreviation1,
				departBeforeName1, a, b, c, d, departChineseName1,
				departArrayNumber1);
		writer.write("{\"success\":true}");
	}
}
