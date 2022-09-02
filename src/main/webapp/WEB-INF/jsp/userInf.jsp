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
                        <span class="link_name">Thông tin khách hàng</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="#"/>">
                        <i class="fa-solid fa-bars-progress"></i>
                        <span class="link_name">Xem vé đã đặt</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="#"/>">
                        <i class="fa-solid fa-bars-progress"></i>
                        <span class="link_name">Xem hàng hóa</span>
                    </a>
                </li>
                                <li>
                    <a href="<c:url value="#"/>">
                        <i class="fa-solid fa-bars-progress"></i>
                        <span class="link_name">Lịch sử giao dịch</span>
                    </a>
                </li>


            </ul>
        </div>
        <div class="col-9">
            <div class="information">
                <div class="qlbx-div">
                    <label class="fw-bold px-3 py-2">Thông tin khách hàng</label>
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
                                    <a href="<c:url value="/userMn/user-info-edit"/>" target="_blank" class="btn btn-primary">Chỉnh Sửa</a>
                                </div>
                            </div>
                        </div> 
                        <div class="basic-info-center">
                            <div class="company-name">
                                <span>${user.username}</span>
                            </div>
                            <div class="rate d-flex">
                                <span class="fw-bold pe-2">Đánh giá: </span>
                                <span>5.0 sao</span>
                            </div>

                            <div class="email d-flex">
                                <span class="fw-bold pe-2">Email: </span>
                                <span>${user.email}</span>
                            </div>
                            <div class="phone-number d-flex">
                                <span class="fw-bold pe-2">Số điện thoại: </span>
                                <span>${user.phoneNumber}</span>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>