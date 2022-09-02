<%-- 
    Document   : companyTripMn
    Created on : Aug 22, 2022, 12:01:38 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    <a class="active" href="<c:url value="/companyMn/company-trip-manager"/>">
                        <i class="fa-solid fa-bus"></i>
                        <span class="link_name">Quản lý chuyến xe</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/companyMn/shipment"/>">
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
                    <label class="fw-bold px-3 py-2">Danh sách các chuyến xe theo tuyến</label>
                </div>
                <div class="qlbx-div mt-3 p-4">
                    <div class="filter">
                        <form action="<c:url value="/companyMn/company-trip-manager"/>">
                            <div class="destination d-flex align-items-center justify-content-lg-between">
                                <label>Điểm đến</label>
                                <select id="route-data" class="form-select w-50" name="routeId">
                                    <c:forEach items="${routes}" var="r">
                                        <c:if test="${r.routeId == routeId}">
                                            <option selected value="${r.routeId}">${r.destination.provinceName}</option>
                                        </c:if>
                                        <c:if test="${r.routeId != routeId}">
                                            <option value="${r.routeId}">${r.destination.provinceName}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                <input type="date" id="trip-date" name="date" value="${date}"/>
                                <div class="filter-r">
                                    <div class="qlbx-btn">
                                        <button id="route-filter" type="submit">
                                            Tìm kiếm
                                            <i class="fa-brands fa-searchengin ps-1"></i>
                                        </button>
                                    </div>
                                    <div class="qlbx-btn">
                                        <button id="add-trip-btn" type="button" data-bs-toggle="modal" data-bs-target="#addTrip">
                                            Thêm Mới
                                            <i class="fa-solid fa-plus ps-1"></i>
                                        </button>
                                    </div>
                                </div>    
                            </div>
                        </form>
                    </div>
                    <div class="result">
                        <div class="result-header d-flex ">
                            <div class="w-25 text-center">
                                <label>Giờ khởi hành</label>
                            </div>
                            <div class="w-25 text-center">
                                <label>Thời gian dự kiến</label>
                            </div>
                            <div class="w-25 text-center">
                                <label>Giá vé</label>
                            </div>
                            <div class="w-25 text-center">
                                <label>Hành động</label>
                            </div>
                        </div>
                        <div class="result-content">
                            <c:forEach items="${trips}" var="trip">
                                <div class="result-item d-flex align-items-center my-3">
                                    <div class="w-25 text-center">
                                        <label>${trip.departureTime}</label>
                                    </div>
                                    <div class="w-25 text-center">
                                        <label>${trip.time}</label>
                                    </div>
                                    <div class="w-25 text-center">
                                        <label>${trip.ticketPrice}</label>
                                    </div>
                                    <div class="w-25 text-center d-flex align-items-center justify-content-center">
                                        <i class="fa-solid fa-pen px-2"></i>
                                        <i class="fa-solid fa-trash px-2"></i>
                                        <div class="qlbx-btn">
                                            <button class="ticket-book-btn" type="button" onclick="getTicketBooked(${trip.tripId})">
                                                <input class="trip-id" type="hidden" value="#ticket-list-${trip.tripId}"/>
                                                Đặt vé
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div id="ticket-list-${trip.tripId}" class="ticket-chosen">
                                    <div class="ticket-list-container d-flex">
                                        <div class="w-75">
                                            <div class="ticket-list">
                                                <div class="ticket-list-title">
                                                    <label>Danh sách vé</label>
                                                </div>
                                                <div class="seat-diagram d-flex">
                                                    <div class="downstairs w-50">
                                                        <label>Tầng dưới</label>
                                                        <div class="downstairs-seats d-flex">
                                                            <div class="A d-flex flex-column">
                                                                <c:forEach begin="1" end="5" var="i">
                                                                    <input class="btn btn-primary btn-seat" type="button" onclick="addToCompanyCart(${trip.tripId},'A${i}D', ${trip.ticketPrice})" value="A${i}D"/>
                                                                </c:forEach>
                                                            </div>
                                                            <div class="B d-flex flex-column">
                                                                <input style="visibility: hidden;" class="btn btn-primary" type="button"/>
                                                                <c:forEach begin="1" end="4" var="i">
                                                                    <input class="btn btn-primary btn-seat" type="button" onclick="addToCompanyCart(${trip.tripId},'B${i}D', ${trip.ticketPrice})" value="B${i}D"/>
                                                                </c:forEach>
                                                            </div>
                                                            <div class="C d-flex flex-column">
                                                                <c:forEach begin="1" end="5" var="i">
                                                                    <input class="btn btn-primary btn-seat" type="button" onclick="addToCompanyCart(${trip.tripId},'C${i}D', ${trip.ticketPrice})" value="C${i}D"/>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="upstairs w-50">
                                                        <label>Tầng trên</label>
                                                        <div class="upstairs-seats d-flex">
                                                            <div class="A d-flex flex-column">
                                                                <c:forEach begin="1" end="5" var="i">
                                                                    <input class="btn btn-primary btn-seat" type="button" onclick="addToCompanyCart(${trip.tripId},'A${i}T', ${trip.ticketPrice})" value="A${i}T"/>
                                                                </c:forEach>
                                                            </div>
                                                            <div class="B d-flex flex-column">
                                                                <input style="visibility: hidden;" class="btn btn-primary" type="button"/>
                                                                <c:forEach begin="1" end="4" var="i">
                                                                    <input class="btn btn-primary btn-seat" type="button" onclick="addToCompanyCart(${trip.tripId},'B${i}T', ${trip.ticketPrice})" value="B${i}T"/>
                                                                </c:forEach>
                                                            </div>
                                                            <div class="C d-flex flex-column">
                                                                <c:forEach begin="1" end="5" var="i">
                                                                    <input class="btn btn-primary btn-seat" type="button" onclick="addToCompanyCart(${trip.tripId},'C${i}T', ${trip.ticketPrice})" value="C${i}T"/>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="note d-flex">
                                                    <div class="booked">
                                                        <span>Ghế đã mua: </span>
                                                        <input class="btn btn-danger" type="button" value="A0D" disabled/>
                                                    </div>
                                                    <div class="empty">
                                                        <span>Ghế trống: </span>
                                                        <input class="btn btn-primary" type="button" value="A0D"/>
                                                    </div>
                                                    <div class="checked">
                                                        <span>Ghế đang chọn </span>
                                                        <input class="btn btn-success" type="button" value="A0D"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-25 ticket-info">
                                            <div class="route-info">
                                                <label class="starting-place">${trip.routeId.startingPlace}</label>
                                                <i class="fa-solid fa-arrow-right"></i>
                                                <label class="destination">${trip.routeId.destination.provinceName}</label>
                                            </div>
                                            <div class="trip-info">
                                                <span class="departure-time d-block">Giờ khởi hành: ${trip.departureTime}</span>
                                                <span class="time d-block">Thời gian dự kiến: ${trip.time}</span>
                                                <span class="price d-block">Giá vé: ${trip.ticketPrice} vnd</span>
                                            </div>
                                            <div class="qlbx-btn">
                                                <button onclick="updateTicket()" class="update-ticket-btn" type="button">
                                                    Cập nhật
                                                </button>
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="addTrip">
            <div class="modal-dialog">
                <div class="modal-content">
                    <c:url value="/companyMn/add-trip" var="addTrip"/>
                    <form:form id="add-trip-form" action="${addTrip}" method="post" modelAttribute="trip">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Thêm chuyến đi</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <form:input id="route-id-hidden" type="hidden" path="routeId" value="${routeId}"/>
                            <form:input id="date-hidden" type="hidden" path="date" value="${date}"/>
                            <label>Giờ xuất phát: </label>
                            <div class="form-floating mb-3 mt-2">
                                <form:input type="time" class="form-control" id="departure-time" placeholder="Giờ xuất phát" path="departureTime"/>
                                <label for="departure-time">Giờ xuất phát</label>
                            </div>
                            <label>Thời gian: </label>
                            <div class="form-floating mb-3 mt-2">
                                <form:input type="text" class="form-control" id="time" placeholder="Thời gian" path="time"/>
                                <label for="time">Thời gian</label>
                            </div>
                            <label>Giá vé: </label>
                            <div class="form-floating mb-3 mt-2">
                                <form:input type="text" class="form-control" id="ticket-price" placeholder="Giá vé" path="ticketPrice"/>
                                <label for="ticket-price">Giá vé</label>
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Thêm mới</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var day = new Date();
    moment().format();
    var mome = moment(day);
    $("#trip-date").val(mome.format("YYYY-MM-DD").toString());
</script>