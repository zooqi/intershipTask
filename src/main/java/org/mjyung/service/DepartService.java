package org.mjyung.service;

import org.mjyung.dao.DepartRepository;
import org.mjyung.entity.Depart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.Objects;

@Service(value = "departService")
@Transactional(readOnly = true)
public class DepartService {

	@Autowired
	private DepartRepository departDepository;

	@Resource(name = "departFiliationService")
	private DepartFiliationService departFiliationService;

	/**
	 * 清理部门(干净删除)
	 *
	 * @param departId
	 *            部门的唯一标识
	 */
	public void deleteDepart(String departId) {
		Objects.requireNonNull(departId, "departId不能为null!");

		departFiliationService.dump(departId);
	}

	/**
	 * 添加部门
	 *
	 * @param depart
	 *            部门对象
	 */
	public void addDepart(String id, String departId,
			String departAbbreviation, String departBeforeName,
			String departCommisionOffic, String departEnable,
			String departDelete, String departChineseName, String departMain,
			String departArrayNumber) {
		Objects.requireNonNull(departId, "departId不能为null!");

		// 添加部门
		Depart depart = new Depart();
		depart.setDepartId(id);
		depart.setDepartAbbreviation(departAbbreviation);
		depart.setDepartBeforeName(departBeforeName);
		Boolean a;
		if ("true".equals(departCommisionOffic)
				|| "是".equals(departCommisionOffic)) {
			a = true;
		} else {
			a = false;
		}
		depart.setDepartCommisionOffic(a);
		Boolean b;
		if ("true".equals(departEnable) || "是".equals(departEnable)) {
			b = true;
		} else {
			b = false;
		}
		depart.setDepartEnable(b);
		Boolean c;
		if ("true".equals(departDelete) || "是".equals(departDelete)) {
			c = true;
		} else {
			c = false;
		}
		depart.setDepartDelete(c);
		Boolean d;
		if ("true".equals(departMain) || "是".equals(departMain)) {
			d = true;
		} else {
			d = false;
		}
		depart.setDepartDelete(d);
		depart.setDepartArrayNumber(departArrayNumber);
		depart.setDepartChineseName(departChineseName);

		departDepository.save(depart);
	}

	/**
	 * 根据部门唯一标识查询部门信息
	 *
	 * @param departId
	 *            部门唯一标识
	 * @return 部门对象
	 */
	public Depart getDepart(String departId) {
		Objects.requireNonNull(departId, "departId不能为null!");

		return departDepository.findOne(departId);
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
	public void updateDepart(String departId, String departAbbreviation,
			String departBeforeName, Boolean departCommisionOffic,
			Boolean departEnable, Boolean departDelete, Boolean departMain,
			String departChineseName, String departArrayNumber) {
		Objects.requireNonNull(departId, "departId不能为null!");

		Depart depart = departDepository.findOne(departId);
		depart.setDepartId(departId);
		depart.setDepartAbbreviation(departAbbreviation);
		depart.setDepartBeforeName(departBeforeName);
		depart.setDepartCommisionOffic(departCommisionOffic);
		depart.setDepartEnable(departEnable);
		depart.setDepartArrayNumber(departArrayNumber);
		depart.setDepartChineseName(departChineseName);
		depart.setDepartDelete(departDelete);
		depart.setDepartMain(departMain);
		departDepository.save(depart);
	}
}
