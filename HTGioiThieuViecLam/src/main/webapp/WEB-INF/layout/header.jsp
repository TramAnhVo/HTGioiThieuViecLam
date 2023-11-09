<%-- 
    Document   : header
    Created on : Jul 26, 2023, 12:54:30 PM
    Author     : Trâm Anh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/" var="action" />
<nav class="d-flex flex-column mb-3 sidenav">
    <div class="p-2">
        <a class="nav-link" href="${action}">Hệ thống giới thiệu việc làm</a>
    </div>
    <div class="p-2">
        <a class="nav-link" href="<c:url value="/admin/companies" />">Doanh nghiệp</a>
    </div>
    <div class="p-2">
        <a class="nav-link" href="<c:url value="/admin/users" />">Người dùng</a>
    </div>
    <div class="p-2">
        <a class="nav-link" href="<c:url value="/admin/jobs" />">Công việc</a>
    </div>
    <div class="p-2">
        <a class="nav-link" href="<c:url value="/locations" />">Khu vực</a>
    </div>
    <div class="p-2">
        <a class="nav-link" href="<c:url value="/majors" />">Ngành nghề</a>
    </div>
    <div class="p-2">
        <a class="nav-link" href="<c:url value="/admin/manageBlog" />">Bài đăng tìm việc</a>
    </div>
</nav>