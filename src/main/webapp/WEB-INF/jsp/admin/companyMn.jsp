<%-- 
    Document   : companyMn
    Created on : Sep 4, 2022, 3:07:08 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="home-section">
    <div class="home-content flex-column">
        <div class="w-100 text-center m-4">
            <span class="fw-bold fs-4">Danh Sách Các Nhà Xe</span>
        </div>
        <div class="list-company">
            <table class="table">
                <thead>
                    <tr>
                        <th>Tên nhà xe</th>
                        <th>Địa chỉ</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listCompany}" var="c">
                        <tr>
                            <td>${c.companyName}</td>
                            <td>${c.address}</td>
                            <td>${c.email}</td>
                            <td>${c.phoneNumber}</td>
                            <c:if test="${c.status == 0}">
                                <td>Chờ duyệt</td>
                                <td>
                                    <button type="button" class="btn btn-info btn-accept" onclick="updateStatusCompany(${c.id}, 1)">Duyệt</button>
                                </td>
                            </c:if>
                            <c:if test="${c.status == 1}">
                                <td>Đang hoạt động</td>
                                <td>
                                    <button type="button" class="btn btn-warning btn-lock" onclick="updateStatusCompany(${c.id}, -1)">Khóa</button>
                                </td>
                            </c:if>
                            <c:if test="${c.status == -1}">
                                <td>Đã bị khóa</td>
                                <td>
                                    <button type="button" class="btn btn-success btn-unlock" onclick="updateStatusCompany(${c.id}, 1)">Mở khóa</button>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>  
                </tbody>
            </table>
        </div>
    </div>
</section>