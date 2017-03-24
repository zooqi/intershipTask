package org.mjyung.service;

import org.mjyung.dao.DepartFiliationRepository;
import org.mjyung.entity.DepartFiliation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "departFiliationService")
public class DepartFiliationService {
	@Autowired
	DepartFiliationRepository departFiliationRepository;

	/**
	 * 删除部门与部门之间的关系
	 * 
	 * @param departId
	 *            部门唯一标识
	 */
	public void deleteDepartFiliation(String departId) {
		departFiliationRepository.deleteDepartFiliation(departId);
	}

	/**
	 * 增加部门与部门之间的关系
	 * 
	 * @param departFiliation
	 *            DepartFiliation对象
	 */
	public void addDepartFiliation(DepartFiliation departFiliation) {
		departFiliationRepository.save(departFiliation);
	}
}
