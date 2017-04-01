package org.mjyung.service;

import org.mjyung.dao.DepartFiliationRepository;
import org.mjyung.entity.DepartFiliation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

@Service(value = "departFiliationService")
@Transactional(readOnly = true)
public class DepartFiliationService {

	@Autowired
	private DepartFiliationRepository repository;

	/**
	 * 清理某部门与其关联(直接或间接)子部门之间的关系、子部门、用户
	 *
	 * @param departId
	 */
	public void dump(String departId) {
		Objects.requireNonNull(departId, "departId不能为null!");

		/* 直接删除 部门 */
		repository.deleteDepartId(departId);

		/* 删除部门下的用户 */
		repository.deleteAssociatedUsers(departId);

		/* 查询此部门直接子部门的departId列表 */
		List<String> subIds = repository.findSubDepartIdsByDepartId(departId);

		if (subIds.size() != 0) {
			/* 如果有直接子部门, 先删除此部门与这些直接子部门之间的关系 */
			repository.deleteByDepartId(departId);
			/* 递归地清理每个直接子部门 */
			for (String subId : subIds) {
				dump(subId);
			}
		} else {
			/* 如果没有直接子部门, 那么删除此部门与其父部门之间的关系 */
			repository.deleteAsSubDepart(departId);
		}
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
	 */
	public void register(String id, String departId) {

		DepartFiliation departFiliation = new DepartFiliation();
		departFiliation.setDepartId(departId);
		departFiliation.setSubDepartId(id);

		repository.save(departFiliation);
	}
}
