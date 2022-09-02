/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import java.math.BigInteger;
import java.sql.Time;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import org.springframework.format.annotation.DateTimeFormat;


/**
 *
 * @author ASUS
 */
@Entity
@Table(name = "trip")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Trip.findAll", query = "SELECT t FROM Trip t"),
    @NamedQuery(name = "Trip.findByTripId", query = "SELECT t FROM Trip t WHERE t.tripId = :tripId"),
    @NamedQuery(name = "Trip.findByDepartureTime", query = "SELECT t FROM Trip t WHERE t.departureTime = :departureTime"),
    @NamedQuery(name = "Trip.findByTime", query = "SELECT t FROM Trip t WHERE t.time = :time")})
public class Trip implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @NotNull
    @Column(name = "trip_id")
    private Integer tripId;
    @Column(name = "date")
//    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    @Column(name = "departure_time")
//    @Temporal(TemporalType.TIMESTAMP)
//    @DateTimeFormat(pattern = "HH:mm")
    private String departureTime;
    @Column(name = "time")
    private String time;
    @Column(name = "ticket_price")
    private BigInteger ticketPrice;
//    @JsonIgnore
    @JoinColumn(name = "route_id", referencedColumnName = "route_id")
    @ManyToOne(optional = false)
    private Route routeId;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Set<Ticket> ticketSet;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tripId")
    private Set<ShipmentDetails> shipmentDetailsSet;

    public Trip() {
    }

    public Trip(Integer tripId) {
        this.tripId = tripId;
    }

    public Integer getTripId() {
        return tripId;
    }

    public void setTripId(Integer tripId) {
        this.tripId = tripId;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @XmlTransient
    public Set<Ticket> getTicketSet() {
        return ticketSet;
    }

    public void setTicketSet(Set<Ticket> ticketSet) {
        this.ticketSet = ticketSet;
    }

    public Route getRouteId() {
        return routeId;
    }

    public void setRouteId(Route routeId) {
        this.routeId = routeId;
    }

    @XmlTransient
    public Set<ShipmentDetails> getShipmentDetailsSet() {
        return shipmentDetailsSet;
    }

    public void setShipmentDetailsSet(Set<ShipmentDetails> shipmentDetailsSet) {
        this.shipmentDetailsSet = shipmentDetailsSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tripId != null ? tripId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Trip)) {
            return false;
        }
        Trip other = (Trip) object;
        if ((this.tripId == null && other.tripId != null) || (this.tripId != null && !this.tripId.equals(other.tripId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qlbx.pojo.Trip[ tripId=" + tripId + " ]";
    }

    /**
     * @return the ticketPrice
     */
    public BigInteger getTicketPrice() {
        return ticketPrice;
    }

    /**
     * @param ticketPrice the ticketPrice to set
     */
    public void setTicketPrice(BigInteger ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }
    
}
