<%-- 
    Document   : indexCompany
    Created on : Sep 12, 2023, 12:06:12 AM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<section style="margin: 0 2%">    

    <div class="row">
        <c:forEach items="${companies}" var="j">
            <c:url value="/companies/${j.id}" var="detail" />
            <div class="item">
                <div class="col-img">
                    <img src="${j.image}" alt="${j.name}">
                </div>

                <div class="col-title">                   
                    <p class="mb-1" style="font-weight: 700"><a href="${detail}">${j.name}</a></p>
                    <p class="mb-1"><a href="${detail}">${j.name}</a></p>
                    <p class="mb-1 text-success">${j.address}</p>
                </div>
            </div>
        </c:forEach>      
    </div>

</section>
