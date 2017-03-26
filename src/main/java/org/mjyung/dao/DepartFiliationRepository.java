package org.mjyung.dao;

import org.mjyung.entity.DepartFiliation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface DepartFiliationRepository extends JpaRepository<DepartFiliation, Long>,
        JpaSpecificationExecutor<DepartFiliation> {

    /**
     * 根据departId删除此部门与其直接子部门的关系
     *
     * @param departId
     */
    @Modifying
    @Query("DELETE FROM DepartFiliation WHERE departId = ?1")
    void deleteByDepartId(String departId);

    /**
     * 根据departId查找其直接子部门departId
     *
     * @param departId
     * @return
     */
    @Query("SELECT subDepartId FROM DepartFiliation WHERE departId = ?1")
    List<String> findSubDepartIdsByDepartId(String departId);

    /**
     * 删除此部门与其父部门之间的关系
     *
     * @param departId
     */
    @Modifying
    @Query("DELETE FROM DepartFiliation WHERE subDepartId = ?1")
    void deleteAsSubDepart(String departId);

    /**
     * 删除此部门下的用户
     *
     * @param departId
     */
    @Modifying
    @Query("DELETE FROM User WHERE departId = ?1")
    void deleteAssociatedUsers(String departId);

    /**
     * 删除此部门
     *
     * @param departId
     */
    @Modifying
    @Query("DELETE FROM Depart WHERE departId = ?1")
    void deleteDepart(String departId);

}
