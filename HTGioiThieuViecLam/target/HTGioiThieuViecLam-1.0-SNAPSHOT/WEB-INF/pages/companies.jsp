<%-- 
    Document   : company
    Created on : Jul 26, 2023, 2:40:42 PM
    Author     : Trâm Anh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="<c:url value="/js/main.js" />"></script>

<c:url value="/admin/companies" var="action" />
<section class="main">

    <a class="btn btn-success p-2 mt-5" href="<c:url value="/admin/companies/formAddCompany" />">Thêm doanh nghiệp</a>

    <table class="table table-hover mt-5">
        <thead class="table-success">
            <tr>
                <th></th>
                <th>Tên doanh nghiệp</th>
                <th>Email</th>
                <th>Năm thành lập</th>
                <th>Địa chỉ doanh nghiệp</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${companies}" var="j">
                <tr>
                    <td>
                        <img src="${j.image}" alt="${j.name}" width="120" />
                    </td>
                    <td>${j.name}</td>
                    <td>${j.email}</td>
                    <td>${j.establish}</td>
                    <td>${j.address}</td>
                    <td>
                        <c:url value="/admin/companies/formAddCompany/${j.id}" var="api" />
                        <a href="${api}" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></a>
                        <c:url value="/companies/${j.id}" var="detail" />
                        <a href="${detail}" class="btn btn-success mt-2"><i class="fa-solid fa-eye"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</section>
