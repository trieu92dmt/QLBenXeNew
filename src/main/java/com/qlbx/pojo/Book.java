/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.math.BigInteger;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
@Table(name = "book")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Book.findAll", query = "SELECT b FROM Book b"),
    @NamedQuery(name = "Book.findByBookId", query = "SELECT b FROM Book b WHERE b.bookId = :bookId"),
    @NamedQuery(name = "Book.findByTicketQuantity", query = "SELECT b FROM Book b WHERE b.ticketQuantity = :ticketQuantity"),
    @NamedQuery(name = "Book.findByBookStatus", query = "SELECT b FROM Book b WHERE b.bookStatus = :bookStatus"),
    @NamedQuery(name = "Book.findByCustomerName", query = "SELECT b FROM Book b WHERE b.customerName = :customerName"),
    @NamedQuery(name = "Book.findByPhoneNumber", query = "SELECT b FROM Book b WHERE b.phoneNumber = :phoneNumber")})
public class Book implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name = "book_id")
    private Integer bookId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ticket_quantity")
    private int ticketQuantity;
    @Column(name = "total")
    private BigInteger total;
    @Column(name = "book_status")
    private Integer bookStatus;
    @Size(max = 45)
    @Column(name = "customer_name")
    private String customerName;
    @Size(max = 45)
    @Column(name = "phone_number")
    private String phoneNumber;
    @OneToMany(mappedBy = "bookId")
    @JsonIgnore
    private Set<Ticket> ticketSet;

    public Book() {
    }

    public Book(Integer bookId) {
        this.bookId = bookId;
    }

    public Book(Integer bookId, int ticketQuantity) {
        this.bookId = bookId;
        this.ticketQuantity = ticketQuantity;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public int getTicketQuantity() {
        return ticketQuantity;
    }

    public void setTicketQuantity(int ticketQuantity) {
        this.ticketQuantity = ticketQuantity;
    }

    public BigInteger getTotal() {
        return total;
    }

    public void setTotal(BigInteger total) {
        this.total = total;
    }

    public Integer getBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(Integer bookStatus) {
        this.bookStatus = bookStatus;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @XmlTransient
    public Set<Ticket> getTicketSet() {
        return ticketSet;
    }

    public void setTicketSet(Set<Ticket> ticketSet) {
        this.ticketSet = ticketSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bookId != null ? bookId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Book)) {
            return false;
        }
        Book other = (Book) object;
        if ((this.bookId == null && other.bookId != null) || (this.bookId != null && !this.bookId.equals(other.bookId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qlbx.pojo.Book[ bookId=" + bookId + " ]";
    }
    
}
