package org.mjyung.service;

import java.util.List;

import org.mjyung.dao.TreeRepository;
import org.mjyung.entity.Depart;
import org.mjyung.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 显示树的service层
 * 
 * @author mjyung
 * @since 2017.03.20
 *
 */
@Service(value = "treeService")
public class TreeService {
	@Autowired
	private TreeRepository treeRepository;

	/**
	 * 获取顶级部门列表
	 *
	 * @return
	 */
	public List<Depart> getMainDeparts() {
		return treeRepository.getMainDeparts();
	}

	/**
	 * 获取某个部门的子部门列表
	 *
	 * @param departId
	 * @return
	 */
	public List<Depart> getSubMenus(String departId) {
		return treeRepository.getSubMenus(departId);
	}

	/**
	 * 根据部门Id获取用户
	 * 
	 * @param departId
	 * @return
	 */
	public List<User> getUsers(String departId) {
		return treeRepository.getUsers(departId);
	}
}
