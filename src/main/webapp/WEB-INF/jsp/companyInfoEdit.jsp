<%-- 
    Document   : companyInfoEdit
    Created on : Aug 26, 2022, 11:10:22 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container my-3">
    <div class="qlbx-div  text-center p-2">
        <label class="fw-bold fs-4">Chỉnh Sửa Thông Tin Nhà Xe</label>
    </div>
    <c:url value="/companyMn/update-company-info" var="updateCompany"/>
    <form:form enctype="multipart/form-data" action="${updateCompany}" modelAttribute="avatarCarCompany">
        <div class="main-content d-flex mt-3">
            <div class="avatar qlbx-div w-25 m-auto">
                <div style="background-image: url('${currentUser.avatar}')" id="image-preview" class="avt-container m-auto">
                </div>
                <div class="text-center">
                    <form:input type="file" id="upload-img" path="file" class="d-none"/>
                    <label id="upload-avt-btn" for="upload-img">
                        Chỉnh sửa
                    </label>
                </div>
            </div>
            <div class="infomation qlbx-div w-75 ms-3 p-3">
                <label class="fw-bold">Tên nhà xe: </label>
                <div class="input-group mb-3 mt-2">
                    <form:input type="text" class="form-control" id="company-name" placeholder="Tên nhà xe" path="companyName" value="${carCompany.companyName}"/>
                </div>
                <label class="fw-bold">Địa chỉ nhà xe: </label>
                <div class="input-group mb-3 mt-2">
                    <form:input type="text" class="form-control" id="company-address" placeholder="Địa chỉ nhà xe" path="address" value="${carCompany.address}"/>
                </div>
                <label class="fw-bold">Email: </label>
                <div class="input-group mb-3 mt-2">
                    <form:input type="email" class="form-control" id="company-email" placeholder="Email" path="email" value="${carCompany.email}"/>
                </div>
                <label class="fw-bold">Số điện thoại: </label>
                <div class="input-group mb-3 mt-2">
                    <form:input type="number" class="form-control" id="company-phone-number" placeholder="Số điện thoại" path="phoneNumber" value="${carCompany.phoneNumber}"/>
                </div>
            </div>
        </div>
        <div class="update-btn text-center my-3">
            <div class="qlbx-btn">
                <button type="submit" class="fs-5">
                    Cập nhật thay đổi
                </button>
            </div>
    </form:form>

</div>
