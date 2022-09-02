<%-- 
   Document   : index
   Created on : Aug 3, 2022, 6:04:44 PM
   Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container mt-3">
    <div class="row">
        <div class="col-md-3 bg-white border-rounded std-padding mb-3 p-1 custom-nav">
            <div class="dropdown p-1">
                <div class="dropdown-select">
                    <div class="d-flex align-items-center">
                        <i class="fa-solid fa-caravan me-3"></i>
                        <a class="select" href="<c:url value="/list-company"/>">Danh sách nhà xe</a>
                    </div>
                    <i class="fa-solid fa-angle-right"></i>
                </div>
                <div class="dropdown-list">
                    <c:forEach items="${carCompany}" var="c">
                        <div class="dropdown-list__item p-1">
                            <a href="<c:url value="/carCompanyDetails/${c.id}"/>">${c.companyName} </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="dropdown p-1">
                <div class="dropdown-select">
                    <div class="d-flex align-items-center">
                        <i class="fa-solid fa-caravan me-3"></i>
                        <span class="select">Danh sách nhà xe</span>
                    </div>
                    <i class="fa-solid fa-angle-right"></i>
                </div>
                <div class="dropdown-list">
                    <div class="dropdown-list__item p-1">
                        <a href="#">Link 1</a>
                    </div>
                    <div class="dropdown-list__item p-1">
                        <a href="#">Link 2</a>
                    </div>
                    <div class="dropdown-list__item p-1">
                        <a href="#">Link 3</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="demo" class="carousel slide mb-3 col-md-9" data-bs-ride="carousel">

            <!-- Indicators/dots -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
            </div>

            <!-- The slideshow/carousel -->
            <div class="carousel-inner border-rounded">
                <div style="height: 550px" class="carousel-item active">
                    <img src="<c:url value="/images/xekhach.jpg"/>" alt="Slide 1" class="d-block" style="width:100%; height: 100%">
                </div>
                <div style="height: 550px" class="carousel-item">
                    <img src="<c:url value="/images/xekhach2.jpg"/>" alt="Slide 2" class="d-block" style="width:100%; height: 100%">
                </div>
                <div style="height: 550px" class="carousel-item">
                    <img src="<c:url value="/images/xekhach3.jpg"/>" alt="Slide 3" class="d-block" style="width:100%; height: 100%">
                </div>
            </div>

            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>
        <!--<form class="d-flex">
            <input class="form-control me-2" type="text" placeholder="Search">
            <button class="btn btn-primary" type="button">Search</button>
        </form>-->
    </div>
</div>

