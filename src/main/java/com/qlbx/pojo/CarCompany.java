/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.hibernate.annotations.ColumnDefault;
import org.springframework.web.multipart.MultipartFile;
/**
 *
 * @author ASUS
 */
@Entity
@Table(name = "car_company")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CarCompany.findAll", query = "SELECT c FROM CarCompany c"),
    @NamedQuery(name = "CarCompany.findById", query = "SELECT c FROM CarCompany c WHERE c.id = :id"),
    @NamedQuery(name = "CarCompany.findByCompanyName", query = "SELECT c FROM CarCompany c WHERE c.companyName = :companyName"),
    @NamedQuery(name = "CarCompany.findByAddress", query = "SELECT c FROM CarCompany c WHERE c.address = :address"),
    @NamedQuery(name = "CarCompany.findByExpireDate", query = "SELECT c FROM CarCompany c WHERE c.expireDate = :expireDate"),
    @NamedQuery(name = "CarCompany.findByEmail", query = "SELECT c FROM CarCompany c WHERE c.email = :email"),
    @NamedQuery(name = "CarCompany.findByPhoneNumber", query = "SELECT c FROM CarCompany c WHERE c.phoneNumber = :phoneNumber")})
public class CarCompany implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "companyId")
    private Set<Route> routeSet;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @Size(max = 45)
    @Column(name = "company_name")
    private String companyName;
    @Size(max = 45)
    @Column(name = "address")
    private String address;
    @Column(name = "expire_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date expireDate;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 45)
    @Column(name = "email")
    private String email;
    @Size(max = 45)
    @Column(name = "phone_number")
    private String phoneNumber;
    @Column(name = "status")
    private Integer status;
    @JoinColumn(name = "id", referencedColumnName = "user_id", insertable = false, updatable = true)
    @OneToOne(optional = false)
    private User user;
    @Transient
    private MultipartFile file;
    
    public CarCompany() {
    }

    public CarCompany(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
        if (!(object instanceof CarCompany)) {
            return false;
        }
        CarCompany other = (CarCompany) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qlbx.pojo.CarCompany[ id=" + id + " ]";
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @XmlTransient
    public Set<Route> getRouteSet() {
        return routeSet;
    }

    public void setRouteSet(Set<Route> routeSet) {
        this.routeSet = routeSet;
    }

    /**
     * @return the status
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(Integer status) {
        this.status = status;
    }


}
