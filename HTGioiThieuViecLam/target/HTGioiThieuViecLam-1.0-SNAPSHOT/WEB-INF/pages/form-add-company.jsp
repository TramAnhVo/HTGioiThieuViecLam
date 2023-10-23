<%-- 
    Document   : form-add-company
    Created on : Sep 16, 2023, 6:42:15 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/admin/companies/formAddCompany" var="action" />
<section class="main">
     <form:form  modelAttribute="company" method="post" enctype="multipart/form-data" action="${action}">
        <form:hidden path="id" />
        <form:hidden path="image" />

        <div class="form-floating mb-3 mt-3">
            <form:input type="text" class="form-control" path="name" id="name" placeholder="Tên doanh nghiệp" name="name" />
            <label for="name">Tên doanh nghiệp</label>
            <form:errors path="name" element="div" cssClass="text-danger" />
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
            <%--<form:errors path="file" element="div" cssClass="text-danger" />--%>

            <c:if test="${company.image != null}">
                <img src="${company.image}" width="120" />
            </c:if>
        </div>

        <button type="submit" class="btn btn-success">
            <c:choose>
                <c:when test="${company.id != null}">Cập nhật doanh nghiệp</c:when>
                <c:otherwise>Thêm doanh nghiệp</c:otherwise>
            </c:choose>
        </button>
    </form:form>
</section>
