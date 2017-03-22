package org.mjyung.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 描述部门和子部门的关系
 *
 * @author mjyung
 * @since 2017.03.19
 */
@Entity
@Table(name = "depart_filiation")
public class DepartFiliation implements Serializable {

    private static final long serialVersionUID = 1968491027843609453L;

    /**
     * ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    /**
     * 部门ID
     */
    @Column(name = "departId")
    private String departId;

    /**
     * 子部门ID
     */
    @Column(name = "subDepartId")
    private String subDepartId;

    public DepartFiliation() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDepartId() {
        return departId;
    }

    public void setDepartId(String departId) {
        this.departId = departId;
    }

    public String getSubDepartId() {
        return subDepartId;
    }

    public void setSubDepartId(String subDepartId) {
        this.subDepartId = subDepartId;
    }
}