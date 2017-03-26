/**
 * @ProjectName : intershipTask
 * @PackageName : org.mjyung.controller
 * @Description : TODO(描述文件的用途)
 * @CreationDate : 2017/3/20 14:29
 */
package org.mjyung.controller;

import com.google.gson.Gson;
import org.mjyung.entity.Depart;
import org.mjyung.entity.Node;
import org.mjyung.entity.User;
import org.mjyung.service.TreeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.Writer;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

/**
 * 显示树形结构的控制器层
 * 
 * @author mjyung
 * @since 2017.03.20
 */
@Controller
public class TreeController {

	@Resource(name = "treeService")
	private TreeService treeService;

	/**
	 * 获取主菜单列表(即:Id是否为空)
	 * 
	 * @param writer
	 * @param id
	 *            departId或者userId
	 * @throws IOException
	 *             异常
	 */
	@RequestMapping("/tree")
	public void tree(Writer writer,
			@RequestParam(value = "id", required = false) String id)
			throws IOException {

        Gson gson = new Gson();

		// 如果id为null, 代表这是zTree的第一次请求, 这时返回顶级部门
		if (id == null) {
			List<Depart> mainDeparts = treeService.getMainDeparts();

			List<Node> nodes = new LinkedList<>();
			for (Depart depart : mainDeparts) {
				Node node = buildNode(depart.getDepartId(),
						depart.getDepartAbbreviation(), true);
				nodes.add(node);
			}
			writer.write(gson.toJson(nodes));
			return;
		}

		List<Depart> subDrparts = treeService.getSubMenus(id);
		List<User> users = treeService.getUsers(id);

		List<Node> nodes = new LinkedList<>();
		for (Depart depart : subDrparts) {
			Node node = buildNode(depart.getDepartId(),
					depart.getDepartAbbreviation(), true);
			nodes.add(node);
		}
		for (User user : users) {
			Node node = buildNode(user.getUserId(), user.getUserAbbreviation(),
					false);
			nodes.add(node);
		}
		writer.write(gson.toJson(nodes));
	}

	/**
	 * New一棵抽象的树
	 * 
	 * @param id
	 * @param name
	 *            部门列表
	 * @param isParent
	 *            判断是否为父节点
	 * @return 返回Node对象，即:抽象的树
	 */
	private Node buildNode(String id, String name, Boolean isParent) {
		Objects.requireNonNull(id, "id不能为null!");
		Objects.requireNonNull(name, "name不能为null!");
		Objects.requireNonNull(isParent, "isParent不能为null!");

		return new Node(id, name, isParent);
	}
}
