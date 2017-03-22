package org.mjyung.dao;

import java.util.List;

import org.mjyung.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface UserRepository extends Repository {
/*
	@Query("CREATE FROM User WHERE departId=?1,userAbbreviation=?2,userAge=?3,userArrayNumber=?4"
			+ ",userBeforeName=?5,userDelete=?6,userEducation=?7,userEnable=?8,userId=?9"
			+ "userLoginName=?10,userPassword=?11,usrPosition=?12,userSex=?13,userTitle=?14")
	void addUser(String departId, String userAbbreviation, Integer userAge,
			String userArrayNumber, String userBeforeName, Boolean userDelete,
			String userEducation, Boolean userEnable, String userId,
			String userLoginName, String userPassword, String usrPosition,
			String userSex, String userTitle);
	
	@Query("UPDARE FROM User WHERE userId=?1")
	void upadateUser(String userId);
	
	@Query("DELETE FROM User WHERE userId=?1")
	void deleteUser(String userId);
	
	@Query("FROM userLoginName=%?1% OR userId=%?2% OR departId=%?3%")
	List<User> selectUser(String userLoginName,String userId,String departId);
	*/
}
