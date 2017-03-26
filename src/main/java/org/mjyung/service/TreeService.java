package org.mjyung.service;

import org.mjyung.dao.TreeRepository;
import org.mjyung.entity.Depart;
import org.mjyung.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 显示树的service层
 *
 * @author mjyung
 * @since 2017.03.20
 */
@Service(value = "treeService")
public class TreeService {

    @Autowired
    private TreeRepository repository;

    /**
     * 获取顶级部门列表
     *
     * @return
     */
    public List<Depart> getMainDeparts() {
        return repository.getMainDeparts();
    }

    /**
     * 获取某个部门的子部门列表
     *
     * @param departId
     * @return
     */
    public List<Depart> getSubMenus(String departId) {
        return repository.getSubMenus(departId);
    }

    /**
     * 根据部门Id获取用户
     *
     * @param departId
     * @return
     */
    public List<User> getUsers(String departId) {
        return repository.getUsers(departId);
    }
}
