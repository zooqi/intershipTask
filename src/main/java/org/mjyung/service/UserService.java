package org.mjyung.service;

import org.mjyung.dao.UserRepository;
import org.mjyung.entity.User;
import org.mjyung.util.IDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

/**
 * user业务层
 *
 * @author mjyung
 * @since 2017.03.13
 */
@Service(value = "userService")
@Transactional(readOnly = true)
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
	 * 添加用户
	 * 
	 * @param departId
	 *            部门唯一标识
	 * @param userAbbreviation
	 *            用户简称
	 * @param userAge
	 *            用户年龄
	 * @param userBeforeName
	 *            用户曾用名
	 * @param userChineseName
	 *            用户中文名
	 * @param userEducation
	 *            用户教育程度
	 * @param userPosition
	 *            用户职务
	 * @param userLoginName
	 *            用户登录名
	 * @param userTitle
	 *            用户职称
	 */
	public void addUser(String departId, String userAbbreviation,
			String userAge, String userBeforeName, String userChineseName,
			String userEducation, String userPosition, String userLoginName,
			String userTitle) {
		Objects.requireNonNull(departId, "departId不能为null!");
		String userId = IDUtils.generateID();

		User user = new User();

		user.setUserId(userId);

		int a = 0;
		if (userAge != null && !userAge.equals("")) {
			a = Integer.parseInt(userAge);
		}
		user.setUserAge(a);

		user.setUserAbbreviation(userAbbreviation);
		user.setUserBeforeName(userBeforeName);
		user.setUserChineseName(userChineseName);
		user.setUserEducation(userEducation);
		user.setUserLoginName(userLoginName);

		user.setUserPosition(userPosition);
		user.setDepartId(departId);

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