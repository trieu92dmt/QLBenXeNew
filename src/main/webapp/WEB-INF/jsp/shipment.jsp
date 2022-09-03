<%-- 
    Document   : shipment
    Created on : Sep 2, 2022, 5:28:43 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container my-3">
    <div class="row">
        <div class="col-3">
            <ul class="nav-links">
                <li>
                    <a href="<c:url value="/companyMn/company-info"/>">
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
                    <a class="active" href="<c:url value="/companyMn/shipment"/>">
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
            <div class="qlbx-div fs-4 fw-bold text-center">
                Danh sách vận chuyển hàng
            </div>
            <div class="qlbx-div mt-3 p-4">
                <div class="filter">
                    <form action="<c:url value="/companyMn/shipment"/>">
                        <div class="d-flex align-items-center justify-content-lg-between text-center">
                            <div class="destination w-25">
                                <label>Điểm đến:</label>
                                <select id="route-data" class="form-select w-75 m-auto" name="routeId" onchange="getListTripByRoute()">
                                    <c:forEach items="${routes}" var="r">
                                        <c:if test="${r.routeId == param.routeId}">
                                            <option selected value="${r.routeId}">${r.destination.provinceName}</option>
                                        </c:if>
                                        <c:if test="${r.routeId != param.routeId}">
                                            <option value="${r.routeId}">${r.destination.provinceName}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="departure-date w-25">
                                <label>Ngày xuất phát:</label>
                                <c:if test="${param.departureDate != null}">
                                    <input type="date" id="trip-date" value="${param.departureDate}" name="departureDate" onchange="getListTripByRoute()"/>
                                </c:if>
                                <c:if test="${param.departureDate == null}">
                                    <input type="date" id="trip-date" name="departureDate" onchange="getListTripByRoute()"/>
                                </c:if>
                            </div>
                            <div class="trip w-25">
                                <label>Chuyến</label>
                                <select id="trip-data" class="form-select w-75 m-auto" name="tripId">
                                    <option>No option</option>
                                </select>
                            </div>

                            <div class="w-25">
                                <div class="qlbx-btn">
                                    <button id="shipment-filter" type="submit">
                                        Tìm kiếm
                                        <i class="fa-brands fa-searchengin ps-1"></i>
                                    </button>
                                </div>
                                <div class="qlbx-btn">
                                    <button id="shipment-filter" type="button" data-bs-toggle="modal" data-bs-target="#addShipment">
                                        Thêm
                                    </button>
                                </div>
                            </div> 
                        </div>
                    </form>
                </div>
            </div>
            <div class="qlbx-div filter-rs mt-3 p-3">
                <table style="font-size: 12px;" class="table">
                    <thead>
                        <tr>
                            <th>Người gửi</th>
                            <th>Người nhận</th>
                            <th>Số điện thoại</th>
                            <th>Email người nhận</th>
                            <th>Thời điểm gửi</th>
                            <th>Thời điểm nhận</th>
                            <th>Phí vận chuyển</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${shipments}" var="s">
                            <tr>
                                <td>${s.sender}</td>
                                <td>${s.receiver}</td>
                                <td>${s.receiverPhone}</td>
                                <td>${s.receiverEmail}</td>
                                <td>${s.sendingTime}</td>
                                <c:if test="${s.status == 0}">
                                    <td>Chưa nhận hàng</td>
                                </c:if>
                                <c:if test="${s.status == 1}">
                                    <td>${s.receivingTime}</td>
                                </c:if>
                                <td><fmt:formatNumber type="number" pattern="###,###" value="${s.cost}"/> VNĐ</td>
                                <td class="d-flex">
                                    <a href="<c:url value="/companyMn/send-email/${s.shipId}"/>">Gửi mail</a>
                                    <c:if test="${s.status == 0}">
                                        <div class="qlbx-btn">                                      
                                            <button style="font-size: 12px;" id="shipment-filter" type="button" onclick="updateShipment(${s.shipId})">
                                                Nhận hàng
                                            </button>
                                        </div>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="modal fade" id="addShipment">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Thông tin vận chuyển hàng</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <c:url value="/companyMn/add-ship-details" var="addShipment"/>
                    <form:form action="${addShipment}" method="post" modelAttribute="shipmentDetails">
                        <div class="modal-body">
                            <form:input type="hidden" value="${trip.tripId}" path="tripId"/>
                            <div class="form-info d-flex justify-content-lg-between">
                                <div class="p-2">
                                    <span class="fw-bold">Tuyến xe đến: </span>
                                    <span>${trip.routeId.destination.provinceName}</span>
                                </div>
                                <div class="p-2">
                                    <span class="fw-bold">Ngày khởi hành: </span>
                                    <span>${trip.date}</span>
                                </div>
                                <div class="p-2">
                                    <span class="fw-bold">Chuyến: </span>
                                    <span>${trip.departureTime}</span>
                                </div>
                            </div>
                            <div class="shipment-details-form d-flex flex-wrap">
                                <div class="form-group w-50 px-2">
                                    <label>Họ tên người gửi: </label>
                                    <div class="form-floating mb-3 mt-2">
                                        <form:input type="text" class="form-control" id="sender" placeholder="Tên người gửi" path="sender"/>
                                        <label for="sender">Tên người gửi</label>
                                    </div>
                                </div>
                                <div class="form-group w-50 px-2">
                                    <label>Họ tên người nhận: </label>
                                    <div class="form-floating mb-3 mt-2">
                                        <form:input type="text" class="form-control" id="receiver" placeholder="Tên người nhận" path="receiver"/>
                                        <label for="receiver">Tên người nhận</label>
                                    </div>
                                </div>
                                <div class="form-group w-50 px-2">
                                    <label>Số điện thoại người nhận: </label>
                                    <div class="form-floating mb-3 mt-2">
                                        <form:input type="text" class="form-control" id="receiver-phone" placeholder="Số điện thoại người nhận" path="receiverPhone"/>
                                        <label for="receiver-phone">Số điện thoại người nhận</label>
                                    </div>
                                </div>
                                <div class="form-group w-50 px-2">
                                    <label>Email người nhận: </label>
                                    <div class="form-floating mb-3 mt-2">
                                        <form:input type="email" class="form-control" id="receiver-email" placeholder="Email người nhận" path="receiverEmail"/>
                                        <label for="receiver-email">Email người nhận</label>
                                    </div>
                                </div>
                                <div class="form-group w-50 px-2">
                                    <label>Phí vận chuyển: </label>
                                    <div class="form-floating mb-3 mt-2">
                                        <form:input type="text" class="form-control" id="cost" placeholder="Phí vận chuyển" path="cost"/>
                                        <label for="cost">Phí vận chuyển</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Lưu thông tin giao hàng</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>           