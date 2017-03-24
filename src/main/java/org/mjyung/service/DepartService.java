package org.mjyung.service;

import java.util.List;

import org.mjyung.dao.DepartRepository;
import org.mjyung.entity.Depart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "departService")
public class DepartService {
	@Autowired
	DepartRepository departRepository;

	/**
	 * 删除部门
	 * 
	 * @param departId
	 *            部门的唯一标识
	 */
	public void deleteDepart(String departId) {
		departRepository.deleteDepart(departId);
	}

	/**
	 * 添加部门
	 * 
	 * @param depart
	 *            部门对象
	 */
	public void addDepart(Depart depart) {
		departRepository.save(depart);
	}

	/**
	 * 根据部门唯一标识查询部门信息
	 * 
	 * @param departId
	 *            部门唯一标识
	 * @return 部门对象
	 */
	public Depart getDepart(String departId) {
		return departRepository.getDepart(departId);
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
			Boolean departEnable) {
		departRepository.updateDepart(departId, departAbbreviation,
				departBeforeName, departCommisionOffic, departEnable);
	}
}
