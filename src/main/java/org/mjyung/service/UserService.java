package org.mjyung.service;

import org.mjyung.dao.UserRepository;
import org.mjyung.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * user业务层
 *
 * @author mjyung
 * @since 2017.03.13
 */
@Service(value = "userService")
public class UserService {

	@Autowired
	private UserRepository userRepository;

	/**
	 * 删除用户信息
	 *
	 * @param userId
	 *            用户唯一标识
	 */
	public void deleteUser(String userId) {
		Objects.requireNonNull(userId, "userId不能为null!");
		userRepository.delete(userId);
	}

	/**
	 * 添加用户信息
	 *
	 * @param user
	 *            用户对象
	 */
	public void addUser(User user) {
		Objects.requireNonNull(user, "user不能为null!");
		userRepository.save(user);
	}

	/**
	 * 查找用户信息
	 *
	 * @param userId
	 *            用户唯一标识
	 * @return 用户对象
	 */
	public User getUser(String userId) {
		Objects.requireNonNull(userId, "userId不能为null!");

		return userRepository.findOne(userId);
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
		Objects.requireNonNull(userId, "userId不能为null!");

		User user = userRepository.findOne(userId);

		user.setUserAbbreviation(userAbbreviation);
		user.setUserAge(userAge);
		user.setUserBeforeName(userBeforeName);
		user.setUserChineseName(userChineseName);
		user.setUserEducation(userEducation);
		user.setUserPosition(userPosition);
		user.setUserSex(userSex);
		user.setUserTitle(userTitle);
		user.setUserId(userId);
		userRepository.save(user);
	}
}