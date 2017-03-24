package org.mjyung.service;

import org.mjyung.dao.UserRepository;
import org.mjyung.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
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

	/**
	 * 删除用户
	 * 
	 * @param userId
	 *            用户唯一标识
	 */
	public void deleteUser(String userId) {
		userRepository.deleteUsert(userId);
	}

	/**
	 * 添加用户
	 * 
	 * @param user
	 *            用户对象
	 */
	public void addUser(User user) {
		userRepository.save(user);
	}
	
	/**
	 * 根据用户唯一标识查找用户信息
	 * 
	 * @param userId
	 *            用户唯一标识
	 * @return 用户对象
	 */
	public User getUser(String userId){
		return userRepository.getUser(userId);
	}

	/**
	 * 更新用户信息
	 * 
	 * @param userId
	 *            用户唯一标识
	 * @param userAbbreviation
	 *            用户简称
	 * @param userAge
	 *            用户年龄
	 * @param userBeforeName
	 *            用户曾用名
	 * @param userChineseName
	 *            用户中文名
	 * @param userEducation
	 *            用户学历
	 * @param userPosition
	 *            用户职务
	 * @param userSex
	 *            用户性别
	 * @param userTitle
	 *            用户职称
	 */
	public void updateUser(String userId, String userAbbreviation, int userAge,
			String userBeforeName, String userChineseName,
			String userEducation, String userPosition, String userSex,
			String userTitle) {
		userRepository.updateUser(userId, userAbbreviation, userAge,
				userBeforeName, userChineseName, userEducation, userPosition,
				userSex, userTitle);
	}
}