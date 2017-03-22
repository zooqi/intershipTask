/**
 * @ProjectName : intershipTask
 * @PackageName : org.mjyung.entity
 * @Description : TODO(描述文件的用途)
 * @CreationDate : 2017/3/20 11:12
 */
package org.mjyung.entity;

import java.io.Serializable;

/**
 * 描述节点之间的关系
 * 
 * @author mjyung
 * @since 2017.03.19
 */
public class Node implements Serializable {

	private static final long serialVersionUID = 6368491026843606457L;

	/**
	 * 部门ID或用户ID
	 */
	private String id;

	/**
	 * 部门名字或用户名字
	 */
	private String name;

	/**
	 * 是否有子节点(子部门或者用户)
	 */
	private Boolean isParent;

	public Node() {
	}

	public Node(String id, String name, Boolean isParent) {
		this.id = id;
		this.name = name;
		this.isParent = isParent;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getParent() {
		return isParent;
	}

	public void setParent(Boolean parent) {
		isParent = parent;
	}
}
