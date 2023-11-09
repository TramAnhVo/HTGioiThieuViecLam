<%-- 
    Document   : form-update-company
    Created on : Sep 9, 2023, 11:13:58 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/formUpdateCompany" var="action" />

<form:form cssClass="container dn" modelAttribute="company" method="post" action="${action}" enctype="multipart/form-data">
    <h2 class="mt-3 text-center text-success">CẬP NHẬT THÔNG TIN DOANH NGHIỆP</h2>
    <form:hidden path="id" />

    <div class="form-floating mt-3 mb-3">
        <form:input type="compa" value="${sessionScope.currentUser.companyId.name}" class="form-control" 
                    path="name" id="compa" name="compa" disabled="true"/>
        <label for="compa" class="form-label"><i class="fa-solid fa-building"></i> Doanh nghiệp</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="email" class="form-control" path="email" id="email" placeholder="Email doanh nghiệp" name="email" />
        <label for="email">Email doanh nghiệp</label>
        <form:errors path="email" element="div" cssClass="text-danger" />
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="establish" id="establish" placeholder="Năm thành lập doanh nghiệp" name="establish" />
        <label for="establish">Năm thành lập doanh nghiệp</label>
        <form:errors path="establish" element="div" cssClass="text-danger" />
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="address" id="address" placeholder="Địa chỉ doanh nghiệp" name="address" />
        <label for="address">Địa chỉ doanh nghiệp</label>
        <form:errors path="address" element="div" cssClass="text-danger" />
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="description" id="description" placeholder="Giới thiệu doanh nghiệp" name="description" />
        <label for="description">Giới thiệu doanh nghiệp</label>
        <form:errors path="description" element="div" cssClass="text-danger" />
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="link" id="link" placeholder="Website doanh nghiệp" name="link" />
        <label for="link">Website doanh nghiệp</label>
        <form:errors path="link" element="div" cssClass="text-danger" />
    </div>

    <div class="form-floating mb-4 mt-4">
        <form:input type="file" class="form-control" id="file" 
                    path="file" name="file" />
        <label for="file">Logo doanh nghiệp</label>

        <c:if test="${company.image != null}">
            <img src="${company.image}" width="120" />
        </c:if>
    </div>


    <button type="submit" class="btn btn-success container" style="width: 80%; margin: 0 10%">
        <c:choose>
            <c:when test="${company.id != null}">Cập nhật doanh nghiệp</c:when>
        </c:choose>
    </button>

    <a href="<c:url value="/profile" />" class="mt-3 btn btn-danger container" style="width: 80%; margin: 0 10%" >Quay trở về</a>
</form:form>

<style>
    .dn  {
        text-decoration: none;
    }
    body {
        background-color: #f3f5f7;
    }
    .dk {
        margin: 1% 20%;
        border: 2px solid white;
        width: 60%;
        background-color: white;
    }
    .form-floating, .msg {
        width: 80%;
        margin: 0 10%;
    }

    i{
        color: green;
    }

    .row {
        display: flex;
        margin: 0 10%;
    }

    .col-50 {
        width: 50%;
        margin: 0;
        padding-right: 0;
    }
</style>
