package org.mjyung.service;

import java.util.List;

import org.mjyung.dao.UserRepository;
import org.mjyung.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * user业务层
 * 
 * @author mjyung
 * @since 2017.03.13
 */
@Service(value = "userService")
public class UserService {
	@Autowired
	UserRepository userRepository;
/*
	void addUser(String departId, String userAbbreviation, Integer userAge,
			String userArrayNumber, String userBeforeName, Boolean userDelete,
			String userEducation, Boolean userEnable, String userId,
			String userLoginName, String userPassword, String usrPosition,
			String userSex, String userTitle) {
		return userRepository.addUser(departId, userAbbreviation, userAge,
				userArrayNumber, userBeforeName, userDelete, userEducation,
				userEnable, userId, userLoginName, userPassword, usrPosition,
				userSex, userTitle);
	}

	void upadateUser(String userId) {
		return userRepository.upadateUser(userId);
	}

	void deleteUser(String userId) {
		return userRepository.upadateUser(userId);
	}

	List<User> selectUser(String userLoginName, String userId, String departId) {
		return userRepository.selectUser(userLoginName, userId, departId);
	}
	*/
}