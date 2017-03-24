package org.mjyung.dao;

import org.mjyung.entity.Depart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface DepartRepository extends JpaRepository<Depart, Long>,
		JpaSpecificationExecutor<Depart> {

	/**
	 * 根据部门唯一标识删除部门
	 * 
	 * @param departId
	 *            部门唯一标识
	 */
	@Modifying
	@Query("DELETE FROM Depart WHERE departId = ?1")
	void deleteDepart(String departId);

	/**
	 * 根据部门唯一标识查找部门信息
	 * 
	 * @param departId
	 *            部门唯一标识
	 * @return 部门对象
	 */
	@Query("FROM Depart WHERE departId=?1")
	Depart getDepart(String departId);

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
	@Modifying
	@Query("UPDATE FROM Depart SET departAbbreviation=?2,departBeforeName=?3,departCommisionOffic=?4,departEnable=?5 WHERE departId=?1")
	void updateDepart(String departId, String departAbbreviation,
			String departBeforeName, Boolean departCommisionOffic,
			Boolean departEnable);
}
