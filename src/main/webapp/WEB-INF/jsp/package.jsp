<%-- 
    Document   : package
    Created on : Aug 15, 2022, 9:56:58 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/carCompanyRegister" var="carCompanyRegister"/>
<div class="titile text-center mt-2">
    <span class="fw-bold h2 text-uppercase">Chọn Gói Đăng Ký</span>
</div>
<div class="container mt-3">
    <ul class="d-flex justify-content-lg-between p-0">
        <c:forEach items="${packages}" var="p"> 
            <div class="card" style="width:400px">
                <img class="card-img-top" src="<c:url value="/images/hutao5.jpg"/>" alt="Card image">
                <div class="card-body">
                    <h4 class="card-title">${p.packageName}</h4>
                    <fmt:setLocale value = "vn_VN"/>
                    <p class="card-text">Price: <fmt:formatNumber type="number" pattern="000,000" value="${p.price}"/> VNĐ</p>
                    <input type="button" class="btn-std-light btn-register-company" value="Đăng ký"/>
                    <input type="hidden" class="package-id" value="${p.id}"/>
                    <input type="hidden" class="package-name" value="${p.packageName}"/>
                    <input type="hidden" class="package-expire" value="${p.expireDate}"/>
                    <input type="hidden" class="package-price" value="${p.price}"/>
                </div>
            </div>
        </c:forEach>
    </ul>
    <div class="company-register">
        <label class="register-form-title">Nhập Thông Tin Đăng Ký Nhà Xe</label>
        <form:form class="row company-register-form" action="${carCompanyRegister}" method="post" modelAttribute="carCompanyRegister">
            <div class="col-4 px-4">
                <div class="company-info">
                    <label class="d-block text-center fw-bold fs-4 pb-3">Thông tin nhà xe</label>
                    <label>Tên nhà xe: </label>
                    <div class="form-floating mb-3 mt-2">
                        <form:input type="text" class="form-control" placeholder="Tên nhà xe" path="carCompany.companyName"/>
                        <label for="companyName">Tên nhà xe</label>
                    </div>
                    <label>Địa chỉ: </label>
                    <div class="form-floating mb-3 mt-2">
                        <form:input type="text" class="form-control" placeholder="Địa chỉ" path="carCompany.address"/>
                        <label for="address">Địa chỉ</label>
                    </div>
                    <label>Email: </label>
                    <div class="form-floating mb-3 mt-2">
                        <form:input type="email" class="form-control" placeholder="Email" path="carCompany.email"/>
                        <label for="email">Email</label>
                    </div>
                    <label>Số điện thoại: </label>
                    <div class="form-floating mb-3 mt-2">
                        <form:input type="text" class="form-control" placeholder="Số điện thoại" path="carCompany.phoneNumber"/>
                        <label for="phoneNumber">Số điện thoại</label>
                    </div>
                </div>
            </div>
            <div class="col-4 px-4">
                <div class="company-account">
                    <label class="d-block text-center fw-bold fs-4 pb-3">Thông tin tài khoản</label>
                    <label>Tên đăng nhập: </label>
                    <div class="form-floating mb-3 mt-2">
                        <form:input type="text" class="form-control" id="username" placeholder="Tên đăng nhập" path="user.username"/>
                        <label for="username">Tên đăng nhập</label>
                    </div>
                    <label>Mật khẩu: </label>
                    <div class="form-floating mb-3 mt-2">
                        <form:input type="password" class="form-control" id="password" placeholder="Mật khẩu" path="user.password"/>
                        <label for="password">Mật khẩu</label>
                    </div>
                    <label>Xác Nhận Mật khẩu: </label>
                    <div class="form-floating mb-3 mt-2">
                        <form:input type="password" class="form-control" id="confirmPassword" placeholder="Nhập lại mật khẩu" path="user.confirmPassword"/>
                        <label for="confirmPassword">Nhập lại mật khẩu</label>
                    </div>
                    <label>Email: </label>
                    <div class="form-floating mb-3 mt-2">
                        <form:input type="email" class="form-control" id="email" placeholder="Email" path="user.email"/>
                        <label for="email">Email</label>
                    </div>
                    <label>Số điện thoại: </label>
                    <div class="form-floating mb-3 mt-2">
                        <form:input type="number" class="form-control" id="phoneNumber" placeholder="Số điện thoại" path="user.phoneNumber"/>
                        <label for="phoneNumber">Số điện thoại</label>
                    </div>
                </div>
            </div>
            <div class="col-4 px-4">
                <label class="d-block text-center fw-bold fs-4 pb-3">Gói Nhà Xe</label>
                <div class="package-info">
                    <input id="package-id" type="hidden" name="packageId" value=""/>
                    <div class="package-info-item d-flex justify-content-lg-between pb-3">
                        <span>Tên gói: </span>
                        <span id="package-name"></span>
                    </div>
                    <div class="package-info-item d-flex justify-content-lg-between pb-3">
                        <span>Thời hạn: </span>
                        <span id="package-expire"></span>
                    </div>
                    <div class="package-info-item d-flex justify-content-lg-between pb-3">
                        <span>Thành tiền: </span>
                        <span id="package-price"></span>
                    </div>
                </div>
                <hr></hr>
                <input class="btn-std-light d-block w-100" type="submit" value="Thanh Toán"/>
            </div>
        </form:form>
    </div>
</div>
