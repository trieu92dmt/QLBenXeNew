<%-- 
    Document   : header
    Created on : Aug 13, 2022, 8:56:33 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <button class="navbar-brand p-0 bg-dark">
            <i class="fa-solid fa-bars text-white"></i>
        </button>
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </li>
            </ul>
        </div>
        <div class="nav-icon me-4">
            <i id="notification" class="fa-solid fa-bell notification"></i>
            <div id="notification-list" class="notification-list">
                <div class="notification-empty">
                    <span class="notification-header">Thông báo</span>
                    <div class="notification-content d-flex flex-column align-items-center p-3">
                        <img src="<c:url value="/images/box.png"/>" alt="alt"/>
                        <span>Đăng nhập để nhận thông báo</span>
                        <a href="#">Đăng nhập</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="navbar-brand m-0">
            <img src="<c:url value="/images/hutao5.jpg"/>" alt="Avatar Logo" style="width:40px;" class="rounded-pill">
            <ul class="nav-brand-menu">
                <li class="p-1">
                    <a class="d-flex" href="<c:url value="/login"/>">
                        <i class="fa-solid fa-right-to-bracket"></i>
                        <span>Đăng nhập vào trái đất</span>
                    </a>
                </li>
                <li class="p-1">
                    <a class="d-flex" href="<c:url value="/login"/>">
                        <i class="fa-solid fa-right-to-bracket"></i>
                        <span>Đăng nhập vào trái đất</span>
                    </a>
                </li>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li class="p-1">
                        <a class="d-flex" href="<c:url value="/login"/>">
                            <i class="fa-solid fa-right-to-bracket"></i>
                            <span>Đăng nhập vào trái đất</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <li class="p-1">
                        <a class="d-flex" href="<c:url value="/logout"/>">
                            <i class="fa-solid fa-right-to-bracket"></i>
                            <span>Đăng xuất khỏi trái đất</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>-->
