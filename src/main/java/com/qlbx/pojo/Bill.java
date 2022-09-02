/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ASUS
 */
@Entity
@Table(name = "bill")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bill.findAll", query = "SELECT b FROM Bill b"),
    @NamedQuery(name = "Bill.findById", query = "SELECT b FROM Bill b WHERE b.id = :id"),
    @NamedQuery(name = "Bill.findByPaymentDate", query = "SELECT b FROM Bill b WHERE b.paymentDate = :paymentDate"),
    @NamedQuery(name = "Bill.findByPaymentOpt", query = "SELECT b FROM Bill b WHERE b.paymentOpt = :paymentOpt")})
public class Bill implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @Column(name = "payment_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date paymentDate;
    @Size(max = 45)
    @Column(name = "payment_opt")
    private String paymentOpt;
    @JoinColumn(name = "company_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private CarCompany companyId;
    @JoinColumn(name = "packet_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Package packetId;

    public Bill() {
    }

    public Bill(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentOpt() {
        return paymentOpt;
    }

    public void setPaymentOpt(String paymentOpt) {
        this.paymentOpt = paymentOpt;
    }

    public CarCompany getCompanyId() {
        return companyId;
    }

    public void setCompanyId(CarCompany companyId) {
        this.companyId = companyId;
    }

    public Package getPacketId() {
        return packetId;
    }

    public void setPacketId(Package packetId) {
        this.packetId = packetId;
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
        if (!(object instanceof Bill)) {
            return false;
        }
        Bill other = (Bill) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qlbx.pojo.Bill[ id=" + id + " ]";
    }
    
}
