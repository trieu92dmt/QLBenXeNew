/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.pojo;

import java.io.Serializable;
import java.math.BigInteger;
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
@Table(name = "shipment_details")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ShipmentDetails.findAll", query = "SELECT s FROM ShipmentDetails s"),
    @NamedQuery(name = "ShipmentDetails.findByShipId", query = "SELECT s FROM ShipmentDetails s WHERE s.shipId = :shipId"),
    @NamedQuery(name = "ShipmentDetails.findBySender", query = "SELECT s FROM ShipmentDetails s WHERE s.sender = :sender"),
    @NamedQuery(name = "ShipmentDetails.findByReceiver", query = "SELECT s FROM ShipmentDetails s WHERE s.receiver = :receiver"),
    @NamedQuery(name = "ShipmentDetails.findByReceiverPhone", query = "SELECT s FROM ShipmentDetails s WHERE s.receiverPhone = :receiverPhone"),
    @NamedQuery(name = "ShipmentDetails.findByReceiverEmail", query = "SELECT s FROM ShipmentDetails s WHERE s.receiverEmail = :receiverEmail"),
    @NamedQuery(name = "ShipmentDetails.findByReceivingTime", query = "SELECT s FROM ShipmentDetails s WHERE s.receivingTime = :receivingTime"),
    @NamedQuery(name = "ShipmentDetails.findBySendingTime", query = "SELECT s FROM ShipmentDetails s WHERE s.sendingTime = :sendingTime"),
    @NamedQuery(name = "ShipmentDetails.findByCost", query = "SELECT s FROM ShipmentDetails s WHERE s.cost = :cost"),
    @NamedQuery(name = "ShipmentDetails.findByStatus", query = "SELECT s FROM ShipmentDetails s WHERE s.status = :status")})
public class ShipmentDetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ship_id")
    private Integer shipId;
    @Size(max = 45)
    @Column(name = "sender")
    private String sender;
    @Size(max = 45)
    @Column(name = "receiver")
    private String receiver;
    @Size(max = 45)
    @Column(name = "receiver_phone")
    private String receiverPhone;
    @Size(max = 45)
    @Column(name = "receiver_email")
    private String receiverEmail;
    @Column(name = "receiving_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date receivingTime;
    @Column(name = "sending_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date sendingTime;
    @Column(name = "cost")
    private BigInteger cost;
    @Column(name = "status")
    private Integer status;
    @JoinColumn(name = "trip_id", referencedColumnName = "trip_id")
    @ManyToOne(optional = false)
    private Trip tripId;

    public ShipmentDetails() {
    }

    public ShipmentDetails(Integer shipId) {
        this.shipId = shipId;
    }

    public Integer getShipId() {
        return shipId;
    }

    public void setShipId(Integer shipId) {
        this.shipId = shipId;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    public String getReceiverEmail() {
        return receiverEmail;
    }

    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
    }

    public Date getReceivingTime() {
        return receivingTime;
    }

    public void setReceivingTime(Date receivingTime) {
        this.receivingTime = receivingTime;
    }

    public Date getSendingTime() {
        return sendingTime;
    }

    public void setSendingTime(Date sendingTime) {
        this.sendingTime = sendingTime;
    }

    public BigInteger getCost() {
        return cost;
    }

    public void setCost(BigInteger cost) {
        this.cost = cost;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Trip getTripId() {
        return tripId;
    }

    public void setTripId(Trip tripId) {
        this.tripId = tripId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (shipId != null ? shipId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ShipmentDetails)) {
            return false;
        }
        ShipmentDetails other = (ShipmentDetails) object;
        if ((this.shipId == null && other.shipId != null) || (this.shipId != null && !this.shipId.equals(other.shipId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qlbx.pojo.ShipmentDetails[ shipId=" + shipId + " ]";
    }
    
}
