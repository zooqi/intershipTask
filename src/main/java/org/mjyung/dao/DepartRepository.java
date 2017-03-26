package org.mjyung.dao;

import org.mjyung.entity.Depart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface DepartRepository extends JpaRepository<Depart, Long>, JpaSpecificationExecutor<Depart> {

    /**
     * 根据departId删除部门
     *
     * @param departId 部门唯一标识
     */
    @Modifying
    @Query("DELETE FROM Depart WHERE departId = ?1")
    void deleteByDepartId(String departId);

    /**
     * 根据departId查找部门
     *
     * @param departId 部门唯一标识
     * @return
     */
    @Query("FROM Depart WHERE departId=?1")
    Depart findByDepartId(String departId);

    /**
     * 根据departId更新部门
     *
     * @param departId             部门唯一标识
     * @param departAbbreviation   部门简称
     * @param departBeforeName     部门曾用名
     * @param departCommisionOffic 是否为执法办
     * @param departEnable         是否启动
     * @return
     */
    @Modifying
    @Query("UPDATE FROM Depart SET departAbbreviation=?2,departBeforeName=?3,departCommisionOffic=?4," +
            "departEnable=?5 WHERE departId=?1")
    void updateByDepartId(String departId, String departAbbreviation,
                          String departBeforeName, Boolean departCommisionOffic,
                          Boolean departEnable);
}
