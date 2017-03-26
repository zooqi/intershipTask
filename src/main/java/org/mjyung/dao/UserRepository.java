package org.mjyung.dao;

import org.mjyung.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;


@Transactional
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {

    /**
     * 根据userId删除用户
     *
     * @param userId 用户唯一标识
     * @return
     */
    @Modifying
    @Query("DELETE FROM User WHERE userId = ?1")
    void deleteByUserId(String userId);

    /**
     * 根据userId查找用户
     *
     * @param userId 用户唯一标识
     * @return
     */
    @Query("FROM User WHERE userId=?1")
    User findByUserId(String userId);

    /**
     * 根据userId更新用户
     *
     * @param userId           用户唯一标识
     * @param userAbbreviation 用户简称
     * @param userAge          用户年龄
     * @param userBeforeName   用户曾用名
     * @param userChineseName  用户中文名
     * @param userEducation    用户学历
     * @param userPosition     用户职务
     * @param userSex          用户性别
     * @param userTitle        用户职称
     */
    @Modifying
    @Query("UPDATE FROM User SET userAbbreviation=?2,userAge=?3,userBeforeName=?4,userChineseName=?5," +
            "userEducation=?6,userPosition=?7,userSex=?8,userTitle=?9 WHERE userId=?1")
    void updateByUserId(String userId, String userAbbreviation, int userAge,
                        String userBeforeName, String userChineseName,
                        String userEducation, String userPosition, String userSex,
                        String userTitle);
}
