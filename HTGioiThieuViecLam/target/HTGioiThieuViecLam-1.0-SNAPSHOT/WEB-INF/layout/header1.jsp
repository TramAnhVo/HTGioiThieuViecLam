<%-- 
    Document   : hearder1
    Created on : Aug 5, 2023, 6:50:20 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="se" uri="http://www.springframework.org/security/tags"  %>
<link href="<c:url value="/css/index.css"/>" rel="stylesheet" type="text/css">

<c:url value="/" var="action" />
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid p-1">
        <a class="navbar-brand" href="${action}">Giới thiệu việc làm</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/indexJob" />"><i class="fa-solid fa-briefcase"></i> Công việc</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/indexCompany" />"><i class="fa-solid fa-building"></i> Doanh nghiệp</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/blog" />"><i class="fa-solid fa-book"></i> Diễn đàn</a>
                </li>
            </ul>

            <ul class="navbar-nav me-2">
                <se:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item" style="margin-right: 12px">
                        <a class="nav-link btn btn-success text-white" href="<c:url value="/admin/jobs" />">Quản lý</a>
                    </li>

                    <li class="nav-item" style="margin-right: 12px">
                        <a class="nav-link btn btn-primary text-white" href="<c:url value="/admin/listCompanies" />">Duyệt doanh nghiệp</a>
                    </li>

                    <li class="nav-item dropdown" style="margin: 0; padding: 0; margin-right: 12px">
                        <a class="nav-link dropdown-toggle btn btn-success text-white" 
                           href="#" role="button" data-bs-toggle="dropdown">Thống kê</a>
                        <ul class="dropdown-menu ">
                            <li class="dropdown-item">
                                <a class="nav-link text-primary" href="<c:url value="/admin/majorStats"/>">
                                    <strong class="hide-nav">Thống kê công việc theo chuyên ngành</strong>
                                </a> 
                            </li>
                            <li class="dropdown-item">
                                <a class="nav-link text-primary" href="<c:url value="/admin/quarterStats"/>">
                                    <strong class="hide-nav">Thống kê ứng tuyển theo quý</strong>
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="nav-link text-primary" href="<c:url value="/admin/yearStats"/>">
                                    <strong class="hide-nav">Thống kê ứng tuyển theo năm</strong>
                                </a>
                            </li>
                        </ul>
                    </li>
                </se:authorize>

                <se:authorize access="hasRole('ROLE_EMPLOYER')">
                    <li class="nav-item" style="margin-right: 10px">
                        <a class="nav-link btn btn-success text-white" href="<c:url value="/employer/formJob" />">Đăng bài</a>
                    </li>

                    <li class="nav-item" style="margin-right: 10px">
                        <a class="nav-link btn btn-success text-white" href="<c:url value="/employer/manageCv" />">Xem ứng viên</a>
                    </li>
                </se:authorize>

                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">                       
                        <li class="nav-item" >
                            <img src="${sessionScope.currentUser.avatar}" alt="Avatar" class="avatar">
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-info" data-bs-toggle="tooltip" title="Thông tin người dùng" href="<c:url value="/profile" />">${pageContext.request.userPrincipal.name}</a>              
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-danger text-white" href="<c:url value="/logout" />">Đăng xuất</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link btn btn-success text-white"  style="margin-right: 10px" href="<c:url value="/login" />">Đăng nhập</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link btn btn-success text-white" href="<c:url value="/register" />">Đăng kí tài khoản</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>

    </div>
</nav>

<style>
    .dropdown-item:hover {
        background-color: lightskyblue;
    }
</style>
