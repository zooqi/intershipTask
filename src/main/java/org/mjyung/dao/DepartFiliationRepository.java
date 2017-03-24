package org.mjyung.dao;

import org.mjyung.entity.DepartFiliation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface DepartFiliationRepository extends
		JpaRepository<DepartFiliation, Long>,
		JpaSpecificationExecutor<DepartFiliation> {
	@Modifying
	@Query("DELETE FROM DepartFiliation WHERE departId = ?1")
	public void deleteDepartFiliation(String departId);
}
