package org.mjyung.controller;

import java.io.IOException;
import java.io.Writer;

import org.mjyung.entity.User;
import org.mjyung.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * user控制器
 *
 * @author mjyung
 * @since 2017.03.13
 */
@Controller
public class UserController {

	@Resource(name = "userService")
	private UserService userService;

	/**
	 * 跳转到user.jsp页面
	 * 
	 * @param userId
	 *            用户Id
	 * @param request
	 * @return String
	 */
	@RequestMapping("/getUserId")
	public String getUserId(String userId, HttpServletRequest request) {
		User user = userService.getUser(userId);
		request.setAttribute("user", user);
		return "WEB-INF/user";
	}

	/**
	 * 删除用户
	 * 
	 * @param userId
	 *            用户的唯一标识
	 * @throws IOException
	 *             异常
	 */
	@RequestMapping("/deleteUser")
	public void deleteUser(HttpServletResponse response, Writer writer,
			@RequestParam(value = "userId", required = true) String userId)
			throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		userService.deleteUser(userId);
		writer.write("{\"success\":true}");
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
	@RequestMapping("/addUser")
	public void addUser(HttpServletResponse response, Writer writer,
			@RequestParam(value = "departId", required = true) String departId,
			String userAbbreviation, String userAge, String userBeforeName,
			String userChineseName, String userEducation, String userPosition,
			String userLoginName, String userTitle) throws IOException {

		response.setContentType("application/json;charset=UTF-8");

		userService.addUser(departId, userAbbreviation, userAge,
				userBeforeName, userChineseName, userEducation, userPosition,
				userLoginName, userTitle);
		writer.write("{\"success\":true}");
	}

	/**
	 * 更新用户信息
	 *
	 * @param userId1
	 *            用户唯一标识
	 * @param userAbbreviation1
	 *            用户简称
	 * @param userAge1
	 *            用户年龄
	 * @param userBeforeName1
	 *            用户曾用名
	 * @param userChineseName1
	 *            用户中文名
	 * @param userEducation1
	 *            用户学历
	 * @param userPosition1
	 *            用户职务
	 * @param userSex1
	 *            用户性别
	 * @param userTitle1
	 *            用户职称
	 * @throws IOException
	 *             异常
	 */
	@RequestMapping("updateUser")
	void updateUser(HttpServletResponse response, Writer writer,
			@RequestParam(value = "userId1", required = true) String userId1,
			String userAbbreviation1, String userAge1, String userBeforeName1,
			String userChineseName1, String userEducation1,
			String userPosition1, String userSex1, String userTitle1)
			throws IOException {
		response.setContentType("application/json;charset=UTF-8");

		int a = 0;
		if (userAge1 != null && !userAge1.equals("")) {
			a = Integer.parseInt(userAge1);
		}

		System.out.println("Controller" + userChineseName1);

		userService.updateUser(userId1, userAbbreviation1, a, userBeforeName1,
				userChineseName1, userEducation1, userPosition1, userSex1,
				userTitle1);
		writer.write("{\"success\":true}");
	}
}