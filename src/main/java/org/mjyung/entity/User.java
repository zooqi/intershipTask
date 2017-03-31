package org.mjyung.entity;

import javax.persistence.*;

import java.io.Serializable;

/**
 * 用户实体
 *
 * @author mjyung
 * @since 2017.03.13
 * 
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "user")
public class User implements Serializable {

	@SuppressWarnings("unused")
	private static final Long serialVersionUID = 7419229779731522702L;

	/**
	 * 用户ID
	 */
	@Id
	@Column(name = "userId")
	private String userId;

	/**
	 * 用户中文名
	 */
	@Column(name = "userChineseName")
	private String userChineseName;

	/**
	 * 用户登录名
	 */
	@Column(name = "userLoginName")
	private String userLoginName;

	/**
	 * 用户性别
	 */
	@Column(name = "userSex")
	private String userSex;

	/**
	 * 用户职务
	 */
	@Column(name = "userPosition")
	private String userPosition;

	/**
	 * 用户职称
	 */
	@Column(name = "userTitle")
	private String userTitle;

	/**
	 * 用户学历
	 */
	@Column(name = "userEducation")
	private String userEducation;

	/**
	 * 用户年龄
	 */
	@Column(name = "userAge")
	private Integer userAge;

	/**
	 * 是否启动
	 */
	@Column(name = "userEnable")
	private Boolean userEnable;

	/**
	 * 是否删除
	 */
	@Column(name = "userDelete")
	private Boolean userDelete;

	/**
	 * 排列序号
	 */
	@Column(name = "userArrayNumber")
	private String userArrayNumber;

	/**
	 * 简称
	 */
	@Column(name = "userAbbreviation")
	private String userAbbreviation;

	/**
	 * 曾用名
	 */
	@Column(name = "userBeforeName")
	private String userBeforeName;

	/**
	 * 用户密码
	 */
	@Column(name = "userPassword")
	private String userPassword;

	/**
	 * 所属部门的ID
	 */
	@Column(name = "departId")
	private String departId;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserChineseName() {
		return userChineseName;
	}

	public void setUserChineseName(String userChineseName) {
		this.userChineseName = userChineseName;
	}

	public String getUserLoginName() {
		return userLoginName;
	}

	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserPosition() {
		return userPosition;
	}

	public void setUserPosition(String userPosition) {
		this.userPosition = userPosition;
	}

	public String getUserTitle() {
		return userTitle;
	}

	public void setUserTitle(String userTitle) {
		this.userTitle = userTitle;
	}

	public String getUserEducation() {
		return userEducation;
	}

	public void setUserEducation(String userEducation) {
		this.userEducation = userEducation;
	}

	public Integer getUserAge() {
		return userAge;
	}

	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}

	public Boolean getUserEnable() {
		return userEnable;
	}

	public void setUserEnable(Boolean userEnable) {
		this.userEnable = userEnable;
	}

	public Boolean getUserDelete() {
		return userDelete;
	}

	public void setUserDelete(Boolean userDelete) {
		this.userDelete = userDelete;
	}

	public String getUserArrayNumber() {
		return userArrayNumber;
	}

	public void setUserArrayNumber(String userArrayNumber) {
		this.userArrayNumber = userArrayNumber;
	}

	public String getUserAbbreviation() {
		return userAbbreviation;
	}

	public void setUserAbbreviation(String userAbbreviation) {
		this.userAbbreviation = userAbbreviation;
	}

	public String getUserBeforeName() {
		return userBeforeName;
	}

	public void setUserBeforeName(String userBeforeName) {
		this.userBeforeName = userBeforeName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getDepartId() {
		return departId;
	}

	public void setDepartId(String departId) {
		this.departId = departId;
	}
}
