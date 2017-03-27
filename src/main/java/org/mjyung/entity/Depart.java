package org.mjyung.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * 部门实体
 *
 * @author mjyung
 * @since 2017.03.13
 */
@Entity
@Table(name = "depart")
public class Depart implements Serializable {

    private static final long serialVersionUID = -7321699381286673240L;
    /**
     * 部门ID
     */
    @Id
    @Column(name = "departId")
    private String departId;

    /**
     * 是否为委员办
     */
    @Column(name = "departCommisionOffic")
    private Boolean departCommisionOffic;

    /**
     * 是否启动
     */
    @Column(name = "departEnable")
    private Boolean departEnable;

    /**
     * 是否删除
     */
    @Column(name = "departDelete")
    private Boolean departDelete;

    /**
     * 排列序号
     */
    @Column(name = "departArrayNumber")
    private String departArrayNumber;

    /**
     * 简称
     */
    @Column(name = "departAbbreviation")
    private String departAbbreviation;

    /**
     * 曾用名
     */
    @Column(name = "departBeforeName")
    private String departBeforeName;

    /**
     * 是否为顶级部门
     */
    @Column(name = "departMain")
    private Boolean departMain;

    /**
     * 部门的下级部门列表
     */
    @Transient
    private List<Depart> subDeparts;

    /**
     * 部门的用户列表
     */
    @Transient
    private List<User> users;

    public Depart() {
    }

    public String getDepartId() {
        return departId;
    }

    public void setDepartId(String departId) {
        this.departId = departId;
    }

    public Boolean getDepartCommisionOffic() {
        return departCommisionOffic;
    }

    public void setDepartCommisionOffic(Boolean departCommisionOffic) {
        this.departCommisionOffic = departCommisionOffic;
    }

    public Boolean getDepartEnable() {
        return departEnable;
    }

    public void setDepartEnable(Boolean departEnable) {
        this.departEnable = departEnable;
    }

    public Boolean getDepartDelete() {
        return departDelete;
    }

    public void setDepartDelete(Boolean departDelete) {
        this.departDelete = departDelete;
    }

    public String getDepartArrayNumber() {
        return departArrayNumber;
    }

    public void setDepartArrayNumber(String departArrayNumber) {
        this.departArrayNumber = departArrayNumber;
    }

    public String getDepartAbbreviation() {
        return departAbbreviation;
    }

    public void setDepartAbbreviation(String departAbbreviation) {
        this.departAbbreviation = departAbbreviation;
    }

    public String getDepartBeforeName() {
        return departBeforeName;
    }

    public void setDepartBeforeName(String departBeforeName) {
        this.departBeforeName = departBeforeName;
    }

    public Boolean getDepartMain() {
        return departMain;
    }

    public void setDepartMain(Boolean departMain) {
        this.departMain = departMain;
    }

    public List<Depart> getSubDeparts() {
        return subDeparts;
    }

    public void setSubDeparts(List<Depart> subDeparts) {
        this.subDeparts = subDeparts;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}