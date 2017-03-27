package org.mjyung.controller;

import org.mjyung.entity.Depart;
import org.mjyung.entity.DepartFiliation;
import org.mjyung.service.DepartFiliationService;
import org.mjyung.service.DepartService;
import org.mjyung.service.UserService;
import org.mjyung.util.IDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;

/**
 * depart控制器
 *
 * @author mjyung
 * @since 2017.03.13
 */
@Controller
public class DepartController {

    @Resource(name = "departService")
    private DepartService departService;

    @Resource(name = "userService")
    private UserService userService;

    @Resource(name = "departFiliationService")
    private DepartFiliationService departFiliationService;

    /**
     * 获得一个判断是否是部门还是用户的参数(前端已判断)，并跳转到相应的页面
     *
     * @param departId 部门的唯一标识
     * @param isParent 是部门还是用户
     * @param request  请求
     * @param response 响应
     * @return 返回需要跳转的页面
     */
    @RequestMapping("/getDepartId")
    public String getDepartId(String departId, HttpServletRequest request,
                              HttpServletResponse response) {
        Depart depart = departService.getDepart(departId);

        request.setAttribute("departAbbreviation", depart.getDepartAbbreviation());
        request.setAttribute("departBeforeName", depart.getDepartBeforeName());
        request.setAttribute("departCommisionOffic", depart.getDepartCommisionOffic());
        request.setAttribute("", depart.getDepartEnable());
        request.setAttribute("departId", departId);
        return "depart";
    }

    /**
     * 删除部门
     *
     * @param departId 部门的唯一标识
     */
    @RequestMapping("deleteDepart")
    public void deleteDepart(HttpServletResponse response, Writer writer, @RequestParam(value = "departId",
            required = true) String departId) throws IOException {
        response.setContentType("application/json;charset=UTF-8");

        departService.deleteDepart(departId);
        writer.write("{\"success\":true}");
    }

    /**
     * 添加部门
     *
     * @param departId             父部门departId
     * @param departAbbreviation   部门简称
     * @param departBeforeName     部门曾用名
     * @param departCommisionOffic 是否为执法办
     * @param departEnable         是否启动
     * @return
     */
    @RequestMapping("/addDepart")
    public void addDepart(HttpServletResponse response, Writer writer, @RequestParam(value = "departId",
            required = true) String departId, String departAbbreviation,
                          String departBeforeName, String departCommisionOffic,
                          String departEnable) throws IOException {
        response.setContentType("application/json;charset=UTF-8");

        // 自动生成departId
        String id = IDUtils.generateID();

        // 添加部门
        Depart depart = new Depart();
        depart.setDepartId(id);
        depart.setDepartAbbreviation(departAbbreviation);
        depart.setDepartBeforeName(departBeforeName);
        Boolean a;
        if ("是".equals(departCommisionOffic)) {
            a = true;
        } else {
            a = false;
        }
        Boolean b;
        if ("是".equals(departEnable)) {
            b = true;
        } else {
            b = false;
        }
        depart.setDepartCommisionOffic(a);
        depart.setDepartEnable(b);
        departService.addDepart(depart);

        /**
         * 添加部门和子部门之间的关系
         */
        DepartFiliation departFiliation = new DepartFiliation();
        departFiliation.setDepartId(departId);
        departFiliation.setSubDepartId(id);
        departFiliationService.register(departFiliation);
        writer.write("{\"success\":true}");
    }

    @RequestMapping("/updateDepart")
    public String updateDepart(String departId1, String departAbbreviation1,
                               String departBeforeName1, Boolean departCommisionOffic1,
                               Boolean departEnable1) {
        departService.updateDepart(departId1, departAbbreviation1,
                departBeforeName1, departCommisionOffic1, departEnable1);
        return "tree";
    }
}
