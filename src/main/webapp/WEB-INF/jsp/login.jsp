<%-- 
    Document   : login
    Created on : Aug 6, 2022, 9:34:06 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid p-0">
    <div class="row">
        <div class="col-6 p-0">
            <img class="w-100" src="<c:url value="/images/xekhach5.jpg"/>" alt=""/>
        </div>
        <div class="col-6 p-0 d-flex">
            <div class="login-form w-50 m-auto">
                <form class="mb-2" action="<c:url value="/user-login"/>" method="post">
                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger">
                            Đăng nhập không thành công!
                        </div>
                    </c:if>
                    <label class="text-center d-block color-blue fs-4">Đăng Nhập</label>
                    <div class="mb-3 mt-3">
                        <label for="username" class="form-label">Tên đăng nhập: </label>
                        <input type="text" class="form-control" id="username" placeholder="Tên đăng nhập" name="username">
                    </div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label">Mật khẩu: </label>
                        <input type="password" class="form-control" id="pwd" placeholder="Mật khẩu" name="password">
                    </div>
<!--                    <div class="form-check mb-3 d-flex justify-content-between">
                        <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" name="remember"> Nhớ mật khẩu
                        </label>
                        <a class="std-link fw-bold" href="">Quên mật khẩu?</a>
                    </div>-->
                    <button type="submit" class="btn btn-primary d-block mx-auto">Đăng nhập</button>
                </form>
                <span>Chưa có tài khoản?</span>
                <a class="std-link fw-bold" href="<c:url value="/register"/>">Đăng kí</a>
            </div>
        </div>
    </div>
</div>
