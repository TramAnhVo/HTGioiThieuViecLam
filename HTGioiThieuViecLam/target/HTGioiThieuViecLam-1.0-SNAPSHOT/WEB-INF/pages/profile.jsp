<%-- 
    Document   : Profile
    Created on : Sep 1, 2023, 2:18:36 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div style="height: 300px; background-image: url('https://anhdepfree.com/wp-content/uploads/2018/11/hinh-nen-Galaxy-Wallpaper-1.jpg')">
    <img src="${sessionScope.currentUser.avatar}" class="avatar" />
</div>
<h1 class="mt-2" style="margin-left: 29%">${sessionScope.currentUser.username}</h1>

<ul class="list-group list-group-flush">
    <div class="list-group-item d-flex">
        <label><i class="fa-solid fa-user"></i> Họ tên tài khoản:</label>
        <p>${sessionScope.currentUser.firstName} ${sessionScope.currentUser.lastName}</p>
    </div>
    
    <div class="list-group-item d-flex">
        <label><i class="fa-solid fa-envelope"></i> Email:</label>
        <p>${sessionScope.currentUser.email}</p>
    </div>
    
    <div class="list-group-item d-flex">
        <label><i class="fa-solid fa-phone"></i> Số điện thoại:</label>
        <p>${sessionScope.currentUser.phone}</p>
    </div>
    
    <se:authorize access="hasRole('ROLE_EMPLOYER')">
    <div class="list-group-item d-flex">
        <label><i class="fa-solid fa-building"></i> Tên doanh nghiệp:</label>
        <p>${sessionScope.currentUser.companyId.name}</p>
    </div>
    
    <div class="list-group-item d-flex">
        <label><i class="fa-solid fa-calendar-days"></i> Năm thành lập:</label>
        <p>${sessionScope.currentUser.companyId.establish}</p>
    </div> 
    
    <div class="list-group-item d-flex">
        <label><i class="fa-solid fa-envelope"></i> Email:</label>
        <p>${sessionScope.currentUser.companyId.email}</p>
    </div> 
    
    <div class="list-group-item d-flex">
        <label><i class="fa-solid fa-location-dot"></i> Địa chỉ:</label>
        <p>${sessionScope.currentUser.companyId.address}</p>
    </div>   
    
       
    <c:url value="/formUpdateCompany/${sessionScope.currentUser.companyId.id}" var="api" />
    <a href="${api}" class="btn btn-success" >Cập nhật thông tin</a>
    
    </se:authorize>
</ul>

<style>
    .avatar {
        vertical-align: middle;
        width: 250px;
        height: 250px;
        border-radius: 50%;
        margin-top: 10%;
        margin-left: 9%;
        border: 1px solid;
    }
    
    label {
        font-weight: 700;
        width: 230px;
    }
    
    label, p {
        padding: 2px 10px;
        font-size: 20px;
    }
    
    .list-group-flush {
        margin: 1% 3% 0 25%;
        padding: 15px;
    }
</style>