<%-- 
    Document   : searchResult
    Created on : Aug 28, 2022, 6:01:50 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container my-3">
    <div class="qlbx-div text-center">
        <span class="fs-4 p-2">Kết quả tra cứu</span>
    </div>
    <div class="search-result">
        <c:url value="/searchResult" var="searchRs"/>
        <form action="${searchRs}">
            <div class="search-bar d-flex justify-content-center align-items-center">
                <div class="destination">
                    <div class="input-group d-flex align-items-center">
                        <label>Chọn điểm đến: </label>
                        <select class="form-select" name="destination" required="true">
                            <c:forEach items="${provinces}" var="p">
                                <option value="${p.id}">${p.provinceName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="departure-date">
                    <div class="input-group d-flex align-items-center">
                        <label>Chọn ngày đi: </label>
                        <div class="form-floating mt-3 mb-3">
                            <input type="date" class="form-control" id="departure-date" placeholder="Ngày đi" name="departure-date" required="true">
                            <label for="departure-date">Ngày đi</label>
                        </div>
                    </div>
                </div>
                <div class="search-btn">
                    <button type="submit" class="btn btn-primary">Tra cứu</button>
                </div>
            </div>
        </form>
        <div class="search-filter w-75 m-auto my-3">
            <label>
                Lọc theo:
            </label>
            <div class="qlbx-btn">
                <button type="button">
                    Giá thấp đến cao
                </button>
            </div>
            <div class="qlbx-btn">
                <button type="button">
                    Đánh giá cao
                </button>
            </div>
        </div>
        <div class="main-result w-75 m-auto">
            <c:forEach items="${trips}" var="t">
                <div class="qlbx-div result-item mt-2">
                    <div class="result-item-container d-flex">
                        <div style="width: 200px;" class="images me-3">
                            <img class="w-100" src="<c:url value="/images/hutao5.jpg"/>" alt="alt"/>
                        </div>
                        <div class="main-content w-100">
                            <div class="top-conent d-flex justify-content-lg-between p-1">
                                <div class="company-name">
                                    <span>${t[6].companyName}</span>
                                </div>
                                <div class="ticket-price">
                                    <span>${t[4]} vnd</span>
                                </div>
                            </div>
                            <div class="center-content">
                                <div class="destination p-1">
                                    <span>Điểm đến: ${t[5].provinceName}</span>
                                </div>
                                <div class="departure-time p-1">
                                    <span>Ngày xuất phát: ${t[1]}</span>
                                </div>
                                <div class="departure-time p-1">
                                    <span>Giờ xuất phát: ${t[2]}</span>
                                </div>
                            </div>
                            <div class="bot-content d-flex justify-content-lg-between p-1">
                                <div class="empty-seat">
                                    <span>28 chỗ còn trống</span>
                                </div>
                                <div class="qlbx-btn">
                                    <button type="button" class="ticket-book-btn" onclick="getTicketBooked(${t[0]})">
                                        <input class="trip-id" type="hidden" value="#ticket-list-${t[0]}"/>
                                        Đặt vé
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="ticket-list-${t[0]}" class="ticket-chosen">
                        <div class="ticket-list-container d-flex">
                            <div class="w-100">
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
                                                        <c:if test="${carts.size() > 0}">
                                                            <c:set value="0" var="check"/>
                                                            <c:forEach items="${carts}" var="c">
                                                                <c:set value="A${i}D" var="seatNumber"/>
                                                                <c:if test="${c.seatNumber == seatNumber && c.tripId == t[0]}">
                                                                    <c:set value="1" var="check"/>
                                                                    <input id="C${i}T-${t[0]}" class="btn btn-success btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'A${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="A${i}D"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${check == 0}">
                                                                <input id="C${i}T-${t[0]}" class="btn btn-primary btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'A${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="A${i}D"/>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${carts.size() == 0 || carts == null}">
                                                            <input id="C${i}T-${t[0]}" class="btn btn-primary btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'A${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="A${i}D"/>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                                <div class="B d-flex flex-column">
                                                    <input style="visibility: hidden;" class="btn btn-primary" type="button"/>
                                                    <c:forEach begin="1" end="4" var="i">
                                                        <c:if test="${carts.size() > 0}">
                                                            <c:set value="0" var="check"/>
                                                            <c:forEach items="${carts}" var="c">
                                                                <c:set value="B${i}D" var="seatNumber"/>
                                                                <c:if test="${c.seatNumber == seatNumber && c.tripId == t[0]}">
                                                                    <c:set value="1" var="check"/>
                                                                    <input id="C${i}T-${t[0]}" class="btn btn-success btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'B${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="B${i}D"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${check == 0}">
                                                                <input id="C${i}T-${t[0]}" class="btn btn-primary btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'B${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="B${i}D"/>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${carts.size() == 0 || carts == null}">
                                                            <input id="C${i}T-${t[0]}" class="btn btn-primary btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'B${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="B${i}D"/>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                                <div class="C d-flex flex-column">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <c:if test="${carts.size() > 0}">
                                                            <c:set value="0" var="check"/>
                                                            <c:forEach items="${carts}" var="c">
                                                                <c:set value="C${i}D" var="seatNumber"/>
                                                                <c:if test="${c.seatNumber == seatNumber && c.tripId == t[0]}">
                                                                    <c:set value="1" var="check"/>
                                                                    <input id="C${i}T-${t[0]}" class="btn btn-success btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'C${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="C${i}D"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${check == 0}">
                                                                <input id="C${i}T-${t[0]}" class="btn btn-primary btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'C${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="C${i}D"/>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${carts.size() == 0 || carts == null}">
                                                            <input id="C${i}T-${t[0]}" class="btn btn-primary btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'C${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="C${i}D"/>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="upstairs w-50">
                                            <label>Tầng trên</label>
                                            <div class="upstairs-seats d-flex">
                                                <div class="A d-flex flex-column">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <c:if test="${carts.size() > 0}">
                                                            <c:set value="0" var="check"/>
                                                            <c:forEach items="${carts}" var="c">
                                                                <c:set value="A${i}T" var="seatNumber"/>
                                                                <c:if test="${c.seatNumber == seatNumber && c.tripId == t[0]}">
                                                                    <c:set value="1" var="check"/>
                                                                    <input id="C${i}T-${t[0]}" class="btn btn-success btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'A${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="A${i}T"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${check == 0}">
                                                                <input id="C${i}T-${t[0]}" class="btn btn-primary btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'A${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="A${i}T"/>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${carts.size() == 0 || carts == null}">
                                                            <input id="C${i}T-${t[0]}" class="btn btn-primary btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'A${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="A${i}T"/>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                                <div class="B d-flex flex-column">
                                                    <input style="visibility: hidden;" class="btn btn-primary" type="button"/>
                                                    <c:forEach begin="1" end="4" var="i">
                                                        <c:if test="${carts.size() > 0}">
                                                            <c:set value="0" var="check"/>
                                                            <c:forEach items="${carts}" var="c">
                                                                <c:set value="B${i}T" var="seatNumber"/>
                                                                <c:if test="${c.seatNumber == seatNumber && c.tripId == t[0]}">
                                                                    <c:set value="1" var="check"/>
                                                                    <input id="C${i}T-${t[0]}" class="btn btn-success btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'B${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="B${i}T"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${check == 0}">
                                                                <input id="C${i}T-${t[0]}" class="btn btn-primary btn-seat btn-seat-${t[0]}-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'B${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="B${i}T"/>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${carts.size() == 0 || carts == null}">
                                                            <input id="C${i}T-${t[0]}" class="btn btn-primary btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'B${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="B${i}T"/>
                                                        </c:if> 
                                                    </c:forEach>
                                                </div>
                                                <div class="C d-flex flex-column">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <c:if test="${carts.size() > 0}">
                                                            <c:set value="0" var="check"/>
                                                            <c:forEach items="${carts}" var="c">
                                                                <c:set value="C${i}T" var="seatNumber"/>
                                                                <c:if test="${c.seatNumber == seatNumber && c.tripId == t[0]}">
                                                                    <c:set value="1" var="check"/>
                                                                    <input id="C${i}T-${t[0]}" class="btn btn-success btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'C${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="C${i}T"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${check == 0}">
                                                                <input id="C${i}T-${t[0]}" class="btn btn-primary btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'C${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="C${i}T"/>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${carts.size() == 0 || carts == null}">
                                                            <input id="C${i}T-${t[0]}" class="btn btn-primary btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'C${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="C${i}T"/>
                                                        </c:if>     
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
                        </div>                                    
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>