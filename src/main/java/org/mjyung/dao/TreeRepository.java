/**
 * @ProjectName : intershipTask
 * @PackageName : org.mjyung.dao
 * @Description : TODO(描述文件的用途)
 * @CreationDate : 2017/3/20 11:18
 */
package org.mjyung.dao;

import org.mjyung.entity.Depart;
import org.mjyung.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 显示整棵树的接口
 *
 * @author mjyung
 * @since 2017.03.20
 */
@Transactional
public interface TreeRepository extends JpaRepository<Depart, Long>, JpaSpecificationExecutor<Depart> {

    /**
     * 获取顶级部门列表
     *
     * @return
     */
    @Query("FROM Depart WHERE departMain = true")
    List<Depart> getMainDeparts();

    /**
     * 获取某个部门的子部门列表
     *
     * @param departId
     * @return
     */
    @Query("FROM Depart WHERE departId IN (SELECT df.subDepartId FROM DepartFiliation df WHERE df.departId = ?1)")
    List<Depart> getSubMenus(String departId);

    /**
     * 根据部门Id获取用户
     *
     * @param departId
     * @return
     */
    @Query("FROM User WHERE departId = ?1")
    List<User> getUsers(String departId);
}
