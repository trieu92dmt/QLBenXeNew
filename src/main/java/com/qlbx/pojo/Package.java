/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.pojo;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ASUS
 */
@Entity
@Table(name = "package")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Package.findAll", query = "SELECT p FROM Package p"),
    @NamedQuery(name = "Package.findById", query = "SELECT p FROM Package p WHERE p.id = :id"),
    @NamedQuery(name = "Package.findByPackageName", query = "SELECT p FROM Package p WHERE p.packageName = :packageName"),
    @NamedQuery(name = "Package.findByPrice", query = "SELECT p FROM Package p WHERE p.price = :price"),
    @NamedQuery(name = "Package.findByExpireDate", query = "SELECT p FROM Package p WHERE p.expireDate = :expireDate")})
public class Package implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @Size(max = 45)
    @Column(name = "package_name")
    private String packageName;
    @Column(name = "price")
    private BigInteger price;
    @Column(name = "expire_date")
    private Integer expireDate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "packetId")
    private Set<Bill> billSet;

    public Package() {
    }

    public Package(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public BigInteger getPrice() {
        return price;
    }

    public void setPrice(BigInteger price) {
        this.price = price;
    }

    public Integer getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Integer expireDate) {
        this.expireDate = expireDate;
    }

    @XmlTransient
    public Set<Bill> getBillSet() {
        return billSet;
    }

    public void setBillSet(Set<Bill> billSet) {
        this.billSet = billSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Package)) {
            return false;
        }
        Package other = (Package) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qlbx.pojo.Package[ id=" + id + " ]";
    }
    
}
