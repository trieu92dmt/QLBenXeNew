<%-- 
    Document   : searchResult
    Created on : Aug 28, 2022, 6:01:50 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container my-3">
    <div class="qlbx-div text-center">
        <span class="fs-4 p-2">Kết quả tra cứu</span>
    </div>
    <div class="search-result">
        <c:url value="/searchResult" var="searchRs"/>
        <form action="${searchRs}">
            <div class="search-bar d-flex justify-content-center align-items-center">
                <div class="destination me-3">
                    <div class="input-group d-flex align-items-center">
                        <label class="pe-3">Chọn điểm đến: </label>
                        <select class="form-select" name="destination" required="true">
                            <c:forEach items="${provinces}" var="p">
                                <c:if test="${param.destination !=null && p.id == param.destination}">
                                    <option selected value="${p.id}">${p.provinceName}</option>
                                </c:if>
                                <c:if test="${param.destination ==null || p.id != param.destination}">
                                    <option value="${p.id}">${p.provinceName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="departure-date me-3">
                    <div class="input-group d-flex align-items-center">
                        <label class="pe-3">Chọn ngày đi: </label>
                        <div class="mt-3 mb-3">
                            <c:if test="${param.departure-date !=null}">
                                <input type="date" class="form-control" id="departure-date" value="${param.departure-date}" placeholder="Ngày đi" name="departure-date" required="true">
                            </c:if>
                            <c:if test="${param.departure-date ==null}">
                                <input type="date" class="form-control" id="departure-date" placeholder="Ngày đi" name="departure-date" required="true">
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="search-btn">
                    <button type="submit" class="btn btn-primary">Tra cứu</button>
                </div>
            </div>
        </form>
        <div class="search-filter w-75 m-auto my-3 d-flex justify-content-lg-between">
            <div class="filter-opt">
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
            <div class="filter-result">
                <c:if test="${trips != null}">
                    <span>${trips.size()} kết quả trả về</span>
                </c:if>
            </div>
        </div>
        <div class="main-result w-75 m-auto">
            <c:if test="${trips.size() > 0}">
                <c:forEach items="${trips}" var="t">
                    <div class="qlbx-div result-item mt-2">
                        <div class="result-item-container d-flex">
                            <div style="width: 200px;" class="images me-3">
                                <img class="w-100" src="<c:url value="/images/hutao5.jpg"/>" alt="alt"/>
                            </div>
                            <div class="main-content w-100">
                                <div class="top-conent d-flex justify-content-lg-between p-1">
                                    <div class="company-name">
                                        <span>
                                            <a class="text-decoration-none" href="<c:url value="/carCompanyDetails/${t[6].id}"/>">${t[6].companyName}</a>
                                        </span>
                                    </div>
                                    <div class="ticket-price">
                                        <span class="badge bg-primary"><fmt:formatNumber type="number" pattern="000,000" value="${t[4]}"/> VNĐ</span>
                                    </div>
                                </div>
                                <div class="center-content">
                                    <div class="destination p-1">
                                        <span>Điểm đến: ${t[5].provinceName}</span>
                                    </div>
                                    <div class="departure-time p-1">
                                        <span>Ngày xuất phát: <fmt:formatDate pattern="dd-MM-yyyy" value="${t[1]}" /></span>
                                    </div>
                                    <div class="departure-time p-1">
                                        <span>Giờ xuất phát: ${t[2]}</span>
                                    </div>
                                </div>
                                <div class="bot-content d-flex justify-content-end p-1">
                                    <div class="qlbx-btn ms-auto">
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
                                        <div class="ticket-list-title text-center fw-bold fs-5">
                                            <label>Danh sách vé</label>
                                        </div>
                                        <div class="seat-diagram d-flex">
                                            <div class="downstairs w-50 text-center">
                                                <label class="fw-bold p-2">Tầng dưới</label>
                                                <div class="downstairs-seats d-flex justify-content-center">
                                                    <div class="A d-flex flex-column">
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <c:if test="${carts.size() > 0}">
                                                                <c:set value="0" var="check"/>
                                                                <c:forEach items="${carts}" var="c">
                                                                    <c:set value="A${i}D" var="seatNumber"/>
                                                                    <c:if test="${c.seatNumber == seatNumber && c.tripId == t[0]}">
                                                                        <c:set value="1" var="check"/>
                                                                        <input id="A${i}T-${t[0]}" class="btn btn-success m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'A${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="A${i}D"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == 0}">
                                                                    <input id="A${i}T-${t[0]}" class="btn btn-primary m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'A${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="A${i}D"/>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${carts.size() == 0 || carts == null}">
                                                                <input id="A${i}T-${t[0]}" class="btn btn-primary m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'A${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="A${i}D"/>
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
                                                                        <input id="B${i}T-${t[0]}" class="btn btn-success m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'B${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="B${i}D"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == 0}">
                                                                    <input id="B${i}T-${t[0]}" class="btn btn-primary m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'B${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="B${i}D"/>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${carts.size() == 0 || carts == null}">
                                                                <input id="B${i}T-${t[0]}" class="btn btn-primary m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'B${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="B${i}D"/>
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
                                                                        <input id="C${i}T-${t[0]}" class="btn btn-success m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'C${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="C${i}D"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == 0}">
                                                                    <input id="C${i}T-${t[0]}" class="btn btn-primary m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'C${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="C${i}D"/>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${carts.size() == 0 || carts == null}">
                                                                <input id="C${i}T-${t[0]}" class="btn btn-primary m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'C${i}D', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="C${i}D"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="upstairs w-50 text-center">
                                                <label class="fw-bold p-2">Tầng trên</label>
                                                <div class="upstairs-seats d-flex justify-content-center">
                                                    <div class="A d-flex flex-column">
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <c:if test="${carts.size() > 0}">
                                                                <c:set value="0" var="check"/>
                                                                <c:forEach items="${carts}" var="c">
                                                                    <c:set value="A${i}T" var="seatNumber"/>
                                                                    <c:if test="${c.seatNumber == seatNumber && c.tripId == t[0]}">
                                                                        <c:set value="1" var="check"/>
                                                                        <input id="A${i}T-${t[0]}" class="btn btn-success m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'A${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="A${i}T"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == 0}">
                                                                    <input id="A${i}T-${t[0]}" class="btn btn-primary m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'A${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="A${i}T"/>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${carts.size() == 0 || carts == null}">
                                                                <input id="A${i}T-${t[0]}" class="btn btn-primary m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'A${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="A${i}T"/>
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
                                                                        <input id="B${i}T-${t[0]}" class="btn btn-success m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'B${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="B${i}T"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == 0}">
                                                                    <input id="B${i}T-${t[0]}" class="btn btn-primary m-1 btn-seat btn-seat-${t[0]}-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'B${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="B${i}T"/>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${carts.size() == 0 || carts == null}">
                                                                <input id="B${i}T-${t[0]}" class="btn btn-primary m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'B${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="B${i}T"/>
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
                                                                        <input id="C${i}T-${t[0]}" class="btn btn-success m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'C${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="C${i}T"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${check == 0}">
                                                                    <input id="C${i}T-${t[0]}" class="btn btn-primary m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'C${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="C${i}T"/>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${carts.size() == 0 || carts == null}">
                                                                <input id="C${i}T-${t[0]}" class="btn btn-primary m-1 btn-seat btn-seat-${t[0]}" type="button" onclick="addToCompanyCart(${t[0]}, 'C${i}T', ${t[4]}, `${t[6].companyName}`, `${t[5].provinceName}`, `${t[1]}`, `${t[2]}`)" value="C${i}T"/>
                                                            </c:if>     
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="note d-flex p-3">
                                            <div class="booked p-2">
                                                <span>Ghế đã mua: </span>
                                                <input class="btn btn-danger" type="button" value="A0D" disabled/>
                                            </div>
                                            <div class="empty p-2">
                                                <span>Ghế trống: </span>
                                                <input class="btn btn-primary" type="button" value="A0D"/>
                                            </div>
                                            <div class="checked-seat p-2">
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
            </c:if>
            <c:if test="${trips.size() == 0}">
                <div class="no-rs text-center">
                    <img class="w-25 p-3" src="<c:url value="/images/box.png"/>" alt="alt"/>
                    <h2 class="text-center p-3">Không Tìm Thấy Chuyến Xe Phù Hợp!!</h2>
                </div>
            </c:if>
        </div>               
    </div>
</div>