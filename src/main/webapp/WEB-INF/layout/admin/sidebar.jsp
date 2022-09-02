<%-- 
    Document   : sidebar
    Created on : Aug 14, 2022, 9:52:20 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="sidebar">
    <div class="logo-details">
        <i class="fa-solid fa-bars"></i>
        <span class="logo_name">Bus Station</span>
    </div>
    <ul class="nav-links">
        <li>
            <a href="">
                <i class="fa-solid fa-chart-line"></i>
                <span class="link_name">Dashboard</span>
            </a>
        </li>
        <li>
            <a href="">
                <i class="fa-solid fa-list-check"></i>
                <span class="link_name">Quản lý nhà xe</span>
            </a>
        </li>
        <li>
            <a href="">
                <i class="fa-solid fa-gear"></i>
                <span class="link_name">Cài đặt</span>
            </a>
        </li>
        <li>
            <div class="profile-details">
                <div class="profile-content">
                    <img src="<c:url value="/images/hutao5.jpg"/>" alt="profile"/>
                </div>
                <div class="name-job">
                    <div class="profile_name">Minh Trieu</div>
                    <div class="job">Manager</div>
                </div>
                <a href="<c:url value="/admin-logout"/>">
                    <i class="fa-solid fa-right-from-bracket"></i>
                </a>
            </div>
        </li>
    </ul>
</div>