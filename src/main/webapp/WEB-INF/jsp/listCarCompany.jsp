<%-- 
    Document   : listCarCompany
    Created on : Aug 24, 2022, 6:17:53 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="titile text-center mt-2">
    <span class="fw-bold h2 text-uppercase">Nhà Xe</span>
</div>
<div class="row">
    <c:forEach var= "c" items="${carcompany}">
        
            <div class="card col-md-4" style="padding: 15px">
                <div class="card-body">
                    <img class="img-fluid card-img-top" src="<c:url value="/images/qiqi.jpg"/>" alt="Card image">

                </div>
                <div class="card-footer">
                    <h5 class="card-title">${c.companyName}</h5>
                    <p>${c.address}</p>
                    <a href="<c:url value="/carCompanyDetails/${c.id}"/>">
                        <input type="button" class="btn-std-light btn-register-company" value="Xem chi tiết"/>
                    </a>
                </div>
            </div>
        
    </c:forEach>

</div>
<div class="text-center">
    <ul class="pagination">
        <li class="page-item"><a class="page-link" href="<c:url value="/"/>?page1">1</a></li>

        <li class="page-item"><a class="page-link" href="<c:url value="/"/>?page2">2</a></li>

    </ul>
</div>