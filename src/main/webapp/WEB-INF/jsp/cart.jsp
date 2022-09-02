<%-- 
    Document   : Cart
    Created on : Aug 31, 2022, 11:07:30 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container my-3">
    <div class="qlbx-div fs-4 text-center">
        Giỏ Hàng
    </div>
    <div class="qlbx-div content mt-3 py-2 px-4">
        <table class="table">
            <thead>
                <tr>
                    <th>Ghế ngồi</th>
                    <th>Nhà xe</th>
                    <th>Điểm đi</th>
                    <th>Ngày đi</th>
                    <th>Giờ xuất phát</th>
                    <th>Giá vé</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${carts}" var="c">
                    <tr>
                        <td>${c.seatNumber}</td>
                        <td>${c.companyName}</td>
                        <td>${c.destination}</td>
                        <td>${c.departureDate}</td>
                        <td>${c.departureTime}</td>
                        <td>${c.price} vnd</td>
                        <td>
                            <button type="button" class="btn btn-danger">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <span>Tổng số vé: ${carts.size()}</span>
        <span>Thành tiền: ${totalPrice} vnđ</span>
        <div>
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#pay">Thanh Toán</button>
        </div>
        <div class="modal fade" id="pay">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Thanh Toán</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <c:url value="/cart/pay-ticket" var="pay"/>
                    <form:form action="${pay}" method="post" modelAttribute="book">
                        <!-- Modal body -->
                        <div class="modal-body">
                            <label>Họ và tên: </label>
                            <div class="form-floating mt-3 mb-3">
                                <form:input type="text" class="form-control" id="customer-name" placeholder="Họ và tên" path="customerName" required="true"/>
                                <label for="customer-name">Họ và tên</label>
                            </div>
                            <label>Số điện thoại: </label>
                            <div class="form-floating mt-3 mb-3">
                                <form:input type="text" class="form-control" id="phone-number" placeholder="Số điện thoại" path="phoneNumber" required="true"/>
                                <label for="phone-number">Số điện thoại</label>
                            </div>
                            <label>Số lượng vé: </label>
                            <div class="form-floating mt-3 mb-3">
                                <input type="number" class="form-control" id="ticket_quantity" placeholder="Số lượng vé" value="${carts.size()}" disabled/>
                                <label for="ticket_quantity">Số lượng vé</label>
                            </div>
                            <label>Thành tiền: </label>
                            <div class="form-floating mt-3 mb-3">
                                <input type="text" class="form-control" id="total" placeholder="Thành tiền" value="${totalPrice}" disabled/>
                                <label for="total">Thành tiền</label>
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger" data-bs-dismiss="modal">Tiếp tục</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>