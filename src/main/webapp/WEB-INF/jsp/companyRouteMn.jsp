<%-- 
    Document   : companyRouteMn
    Created on : Aug 20, 2022, 3:49:16 PM
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
                    <a class="active" href="">
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
                    <label class="fw-bold px-3 py-2">Danh sách các tuyến xe</label>
                </div>
                <c:if test="${messageSuccess != null}">
                    <div class="alert alert-success">
                        <strong>Thành công!</strong> ${messageSuccess}.
                    </div>
                </c:if>
                <c:if test="${messageFailure != null}">
                    <div class="alert alert-danger">
                        <strong>Thất bại!</strong> ${messageFailure}.
                    </div>
                </c:if>
                <div class="routes mt-3 qlbx-div">
                    <ul class="routes-container">
                        <li class="routes-header d-flex py-2 px-3">
                            <div class="routes-header-content w-50">
                                <span class="d-block">Điểm xuất phát</span>
                                <span class="d-block">Điểm đến</span>
                            </div>
                            <div class="add-route-btn w-50 d-flex align-items-center justify-content-end">
                                <div class="qlbx-btn">
                                    <button type="button" class="mhy-button__button" data-bs-toggle="modal" data-bs-target="#addRoute">
                                        Thêm Mới
                                        <i class="fa-solid fa-plus ps-1"></i>
                                    </button>
                                </div>
                            </div>
                        </li>
                        <hr class="p-0 m-1">
                        <c:forEach items="${routes}" var="r">
                            <li class="routes-header d-flex py-2 px-3">
                                <div class="routes-header-content w-50">
                                    <span class="d-block">${r.startingPlace}</span>
                                    <i class="fa-solid fa-arrow-right"></i>
                                    <span class="d-block">${r.destination.provinceName}</span>
                                </div>
                                <div class="add-route-btn w-50 d-flex align-items-center justify-content-end">
<!--                                    <div class="qlbx-btn ms-1">
                                        <button type="button" class="route-details-btn" value="" data-bs-toggle="modal" data-bs-target="#routeDetails">
                                            <input type="hidden" class="starting-place-data" value=""/>
                                            <input type="hidden" class="destination-data" value=""/>
                                            Xem Chi Tiết
                                        </button>
                                    </div>-->
                                    <div class="qlbx-btn ms-1">
                                        <button type="button" class="mhy-button__button">
                                            Sửa
                                        </button>
                                    </div>
                                    <div class="qlbx-btn ms-1">
                                        <button type="button" class="route-delete-btn" onclick="deleteRouteById(${r.routeId})">
                                            Xóa
                                        </button>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <ul class="pagination justify-content-center m-3">
                    <c:forEach begin="1" end="${Math.ceil(routeCount/6)}" var="i">
                        <li class="page-item"><a class="page-link" href="<c:url value="/companyMn/company-route-manager/"/>?page=${i}">${i}</a></li>
                        </c:forEach>
                </ul>
            </div>
            <div class="modal fade" id="addRoute">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <c:url value="/companyMn/add-route" var="addRoute"/>
                        <form:form action="${addRoute}" method="post" modelAttribute="route">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Thêm tuyến đi</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <label>Điểm xuất phát: </label>
                                <div class="form-floating mb-3 mt-2">
                                    <form:input type="text" class="form-control" id="startingPlace" placeholder="Điểm xuất phát" path="startingPlace"/>
                                    <label for="startingPlace">Điểm xuất phát</label>
                                </div>
                                <label>Điểm đến: </label>
                                <div class="mb-3 mt-2">
                                    <form:select class="form-select" path="destination">
                                        <c:forEach items="${provinces}" var="p">
                                            <form:option value="${p.id}">${p.provinceName}</form:option>
                                        </c:forEach>
                                    </form:select>
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
</div>
<script>
    var day = new Date();
    moment().format();
    var mome = moment(day);
    $("#trip-date").val(mome.format("YYYY-MM-DD").toString());
</script>