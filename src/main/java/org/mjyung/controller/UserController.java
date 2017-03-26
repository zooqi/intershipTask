package org.mjyung.controller;

import org.mjyung.entity.User;
import org.mjyung.service.UserService;
import org.mjyung.util.IDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping("/getUserId")
    public String getUserId(String userId, HttpServletRequest request) {
        User user = userService.getUser(userId);
        request.setAttribute("userAbbreviation", user.getUserAbbreviation());
        request.setAttribute("userAge", user.getUserAge());
        request.setAttribute("userBeforeName", user.getUserBeforeName());
        request.setAttribute("userChineseName", user.getUserChineseName());
        request.setAttribute("userPosition", user.getUserPosition());
        request.setAttribute("userEducation", user.getUserEducation());
        request.setAttribute("userSex", user.getUserSex());
        request.setAttribute("userTitle", user.getUserTitle());
        request.setAttribute("userId", userId);
        return "user";
    }

    @RequestMapping("/deleteUser")
    public void deleteUser(String userId) {
        userService.deleteUser(userId);
    }

    @RequestMapping("/addUser")
    public String addUser(String departId, String userAbbreviation,
                          String userAge, String userBeforeName, String userChineseName,
                          String userEducation, String userPosition, String userLoginName) {
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

        userService.addUser(user);
        return "tree";
    }

    /**
     * 更新用户信息
     *
     * @param userId1           用户唯一标识
     * @param userAbbreviation1 用户简称
     * @param userAge1          用户年龄
     * @param userBeforeName1   用户曾用名
     * @param userChineseName1  用户中文名
     * @param userEducation1    用户学历
     * @param userPosition1     用户职务
     * @param userSex1          用户性别
     * @param userTitle1        用户职称
     */
    @RequestMapping("updateByUserId")
    String updateUser(String userId1, String userAbbreviation1,
                      String userAge1, String userBeforeName1, String userChineseName1,
                      String userEducation1, String userPosition1, String userSex1,
                      String userTitle1) {
        System.out.println("userId=" + userId1);
        int a = 0;
        if (userAge1 != null && !userAge1.equals("")) {
            a = Integer.parseInt(userAge1);
        }
        userService.updateUser(userId1, userAbbreviation1, a,
                userBeforeName1, userChineseName1, userEducation1,
                userPosition1, userSex1, userTitle1);
        return "tree";
    }
}