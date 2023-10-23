<%-- 
    Document   : company
    Created on : Jul 26, 2023, 2:40:42 PM
    Author     : Trâm Anh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="<c:url value="/js/main.js" />"></script>

<h1 class="text-center text-primary mt-5 mb-4" >DANH SÁCH DOANH NGHIỆP CHƯA HOẠT ĐỘNG</h1>
<table class="table table-hover container">
    <thead class="table-success">
        <tr>
            <th><i class="fa-solid fa-building"></i> Tên doanh nghiệp</th>
            <th><i class="fa-solid fa-location-dot"></i> Địa chỉ</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${companiesF}" var="c">
            <tr>
                <td>${c.companyId.name}</td>
                <td>${c.companyId.address}</td>                          
                <td>
                    <c:url value="/admin/companies/${c.id}" var="api" />
                    <button class="btn btn-success mt-2" id="btn-hide" onclick="updateActive('${api}')">Hoạt động</button>
                    <div class="spinner-border" id="loadingOverlay" style="display: none"></div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<h1 class="text-center text-primary mt-5 mb-4" >DANH SÁCH DOANH NGHIỆP HOẠT ĐỘNG</h1>
<table class="table table-hover container">
    <thead class="table-success">
        <tr>
            <th><i class="fa-solid fa-building"></i> Tên doanh nghiệp</th>
            <th><i class="fa-solid fa-location-dot"></i> Địa chỉ</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${companiesT}" var="c">
            <tr>
                <td>${c.companyId.name}</td>
                <td>${c.companyId.address}</td>                          
                <td>
                    <c:url value="/admin/companies/${c.id}" var="api" />
                    <button class="btn btn-danger btn-hide" id="btn-hide" onclick="updateActive('${api}')"><i class="fa-solid fa-lock"></i></button>
                    <div class="spinner-border" id="loadingOverlay" style="display: none"></div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
