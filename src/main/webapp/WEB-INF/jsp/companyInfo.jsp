<%-- 
    Document   : companyMn
    Created on : Aug 19, 2022, 9:11:49 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container my-3">
    <div class="row">
        <div class="col-3">
            <ul class="nav-links">
                <li>
                    <a class="active" href="">
                        <i class="fa-solid fa-circle-info"></i>
                        <span class="link_name">Thông tin nhà xe</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/companyMn/company-route-manager"/>">
                        <i class="fa-solid fa-bars-progress"></i>
                        <span class="link_name">Quản lý tuyến xe</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/companyMn/company-trip-manager"/>">
                        <i class="fa-solid fa-bus"></i>
                        <span class="link_name">Quản lý chuyến xe</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <i class="fa-solid fa-ticket"></i>
                        <span class="link_name">Giao hàng</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <i class="fa-solid fa-business-time"></i>
                        <span class="link_name">Gia hạn gói nhà xe</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/companyMn/revenue-stat"/>">
                        <i class="fa-solid fa-chart-pie"></i>
                        <span class="link_name">Thống kê doanh thu</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/companyMn/frequency-stat"/>">
                        <i class="fa-solid fa-chart-pie"></i>
                        <span class="link_name">Thống kê tần suất</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-9">
            <div class="information">
                <div class="qlbx-div">
                    <label class="fw-bold px-3 py-2">Thông tin nhà xe</label>
                </div>
                <div class="basic-info mt-3">
                    <div class="basic-info--wrap">
                        <div class="basic-info-header">
                            <div class="basic-info-header__avatar">
                                <div class="company-avatar">
                                    <img class="mhy-avatar__img" style="background-image: url('${currentUser.avatar}')"> 
                                </div> <!----> 
                            </div> 
                            <div class="basic-info-header__buttons"><!----> 
                                <div class="qlbx-btn-link">
                                    <a href="<c:url value="/companyMn/company-info-edit"/>" target="_blank" class="btn btn-primary">Chỉnh Sửa</a>
                                </div>
                            </div>
                        </div> 
                        <div class="basic-info-center">
                            <div class="company-name">
                                <span>${carCompany.companyName}</span>
                            </div>
                            <div class="rate d-flex">
                                <span class="fw-bold pe-2">Đánh giá: </span>
                                <span>5.0 sao</span>
                            </div>
                            <div class="address d-flex">
                                <span class="fw-bold pe-2">Địa chỉ: </span>
                                <span>${carCompany.address}</span>
                            </div>
                            <div class="email d-flex">
                                <span class="fw-bold pe-2">Email: </span>
                                <span>${carCompany.email}</span>
                            </div>
                            <div class="phone-number d-flex">
                                <span class="fw-bold pe-2">Số điện thoại: </span>
                                <span>${carCompany.phoneNumber}</span>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>