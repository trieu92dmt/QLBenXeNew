<%-- 
    Document   : stat
    Created on : Sep 2, 2022, 2:54:18 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <a class="active" href="<c:url value="/companyMn/revenue-stat"/>">
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
                    <label class="fw-bold px-3 py-2">Thống Kê Doanh Thu Các Tuyến Đi</label>
                </div>
                <div class="qlbx-div mt-3 px-3 py-2">
                    <div class="stat-by-month">
                        <label class="py-2">Thống kê theo tháng</label>
                        <form>
                            <div class="row">
                                <div class="col">
                                    <input type="number" class="form-control" placeholder="Tháng" name="month">
                                </div>
                                <div class="col">
                                    <input type="number" class="form-control" placeholder="Năm" name="year">
                                </div>
                                <div class="col">
                                    <button type="submit" class="btn btn-primary">Thực hiện</button>
                                </div>                                
                            </div>
                        </form>
                    </div>
                    <div class="stat-by-quarter">
                        <label class="py-2">Thống kê theo quý</label>
                        <form>
                            <div class="row">
                                <div class="col">
                                    <input type="number" class="form-control" placeholder="Quý" name="quarter">
                                </div>
                                <div class="col">
                                    <input type="number" class="form-control" placeholder="Năm" name="year">
                                </div>
                                <div class="col">
                                    <button type="submit" class="btn btn-primary">Thực hiện</button>
                                </div>                                
                            </div>
                        </form>
                    </div>
                    <div class="stat-by-year">
                        <label class="py-2">Thống kê theo năm</label>
                        <form>
                            <div class="row">
                                <div class="col">
                                    <input type="number" class="form-control" placeholder="Năm" name="year">
                                </div>
                                <div class="col">
                                    <button type="submit" class="btn btn-primary">Thực hiện</button>
                                </div>                                
                            </div>
                        </form>
                    </div>
                </div>
                <c:if test="${statResult != null}">
                    <div class="qlbx-div mt-3 px-3 py-2 stat-result">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Mã tuyến</th>
                                    <th>Điểm đến</th>
                                    <th>Doanh thu</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${statResult}" var="s">
                                    <tr>
                                        <td>${s[0]}</td>
                                        <td>${s[1].provinceName}</td>
                                        <td><fmt:formatNumber type="number" pattern="###,###" value="${s[2]}"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>   
                <div class="chart my-3">
                    <canvas id="myChart"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stat.js"/>"></script>
<script type="text/javascript">
    let labelInfos = [], datas = [];

    <c:forEach items="${statResult}" var="s">
        labelInfos.push('${s[1].provinceName}');
        datas.push(${s[2]});
    </c:forEach>

    window.onload = function () {
        revenueStat(labelInfos, datas);
    }
</script>