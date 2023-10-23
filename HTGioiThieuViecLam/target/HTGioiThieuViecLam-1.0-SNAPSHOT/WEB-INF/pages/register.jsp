<%-- 
    Document   : Register
    Created on : Aug 12, 2023, 10:53:49 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<script src="<c:url value="/js/main.js" />"></script>

<c:url value="/register" var="action" />

<section>
    <form:form cssClass="conatiner dk" modelAttribute="user" action="${action}" method="post" enctype="multipart/form-data">
        <h2 class="mt-3 text-center text-success">ĐĂNG KÍ TÀI KHOẢN</h2>

        <div class="row">
            <div class="form-floating mt-2 col-50" style="padding-left: 0">
                <form:input type="text" class="form-control" path="firstName" id="firstName" placeholder="Họ" name="firstName" />
                <label for="firstName" style="padding: 20px">Họ</label>
                <%--<form:errors path="title" element="div" cssClass="text-danger" />--%>
            </div>

            <div class="form-floating mt-2 col-50">
                <form:input type="text" class="form-control" path="lastName" id="lastName" placeholder="Tên" name="lastName" />
                <label for="lastName" style="padding: 20px">Tên</label>
                <%--<form:errors path="title" element="div" cssClass="text-danger" />--%>
            </div>
        </div>

        <div class="form-floating mb-2 mt-2">
            <form:select class="form-select" id="gender" name="gender" path="gender">
                <form:option value="Nữ">Nữ</form:option>
                <form:option value="Nam">Nam</form:option>   
            </form:select>
            <label for="gender" class="form-label"><i class="fa-solid fa-circle-user"></i> Giới tính</label>
        </div>

        <div class="form-floating mb-3 mt-3">
            <form:select class="form-select" id="loca" name="loca" path="locationId">
                <c:forEach items="${locations}" var="c">
                    <c:choose>
                        <c:when test="${c.id == job.locationId.id}"><option value="${c.id}" selected>${c.name}</option></c:when>
                        <c:otherwise><option value="${c.id}">${c.name}</option></c:otherwise>
                    </c:choose>

                </c:forEach>
            </form:select>
            <label for="loca" class="form-label">Khu vực</label>
        </div> 

        <div class="form-floating mb-2 mt-2">
            <form:input type="email" class="form-control" path="email" id="email" placeholder="email" name="email" />
            <label for="email"><i class="fa-solid fa-envelope"></i> Email</label>
            <%--<form:errors path="salary" element="div" cssClass="text-danger" />--%>
        </div>

        <div class="form-floating mb-2 mt-2">
            <form:input type="text" class="form-control" path="phone" id="phone" placeholder="Số điện thoại" name="phone" />
            <label for="phone"><i class="fa-solid fa-phone"></i> Số điện thoại</label>
            <%--<form:errors path="salary" element="div" cssClass="text-danger" />--%>
        </div>

        <div class="form-floating mb-2 mt-2">
            <form:input type="text" class="form-control" path="username" id="username" placeholder="Tên đăng nhập" name="username" />
            <label for="username"><i class="fa-solid fa-user"></i> Tên đăng nhập</label>
            <%--<form:errors path="salary" element="div" cssClass="text-danger" />--%>
        </div>

        <div class="form-floating mb-2 mt-2">
            <form:input type="password" class="form-control" path="password" id="password" placeholder="Mật khẩu" name="password" />
            <label for="password"><i class="fa-solid fa-key"></i> Mật khẩu</label>
            <%--<form:errors path="salary" element="div" cssClass="text-danger" />--%>
        </div>

        <div class="form-floating mb-2 mt-2">
            <form:input type="password" class="form-control" path="confirmPassword" id="confirm-password" placeholder="Xác nhận mật khẩu" name="confirm-password" />
            <label for="confirm-password"><i class="fa-solid fa-key"></i> Xác nhận mật khẩu</label>
            <%--<form:errors path="salary" element="div" cssClass="text-danger" />--%>
        </div>

        <c:if test="${errMsg != null}">
            <div class="alert alert-danger msg">
                ${errMsg}
            </div>    
        </c:if>

        <div class="form-floating mb-2 mt-2">
            <form:input type="file" class="form-control" id="file" 
                        path="file" name="file" />
            <label for="file"><i class="fa-solid fa-image"></i> Ảnh đại diện</label>
        </div>

        <div class="form-floating mb-2 mt-2" onclick="load()"">
            <form:select class="form-select" id="userRole" name="userRole" path="userRole">
                <form:option value="ROLE_USER">Người ứng tuyển</form:option>
                <form:option value="ROLE_EMPLOYER">Nhà tuyển dụng</form:option>   
            </form:select>
            <label for="userRole" class="form-label"><i class="fa-solid fa-circle-user"></i> Loại người dùng</label>
        </div>

        <div class="content abc" style="background-color: white">
            <div class="form-floating mb-2 mt-2">
                <form:input type="companyName" class="form-control" path="companyName" id="companyName" placeholder="Tên doanh nghiệp" name="companyName" />
                <label for="companyName"><i class="fa-solid fa-key"></i> Tên doanh nghiệp</label>
                <%--<form:errors path="salary" element="div" cssClass="text-danger" />--%>
            </div>

            <div class="form-floating mb-2 mt-2">
                <form:input type="addressName" class="form-control" path="AddressCompany" id="addressName" placeholder="Địa chỉ doanh nghiệp" name="addressName" />
                <label for="addressName"><i class="fa-solid fa-location-dot"></i> Địa chỉ doanh nghiệp</label>
                <%--<form:errors path="salary" element="div" cssClass="text-danger" />--%>
            </div>
        </div>

        <button type="submit" class="btn btn-success btn-lg mt-2 container mb-2" style="width: 80%; margin: 0 10%">Đăng kí tài khoản</button>

        <h5 class="text-center mt-2 mb-2">Bạn đã có tài khoản? <a class="text-danger dn" href="<c:url value="/login" />">Đăng nhập ngay!</a></h5>
    </form:form>
</section>


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
    .abc {
        display: none;
        overflow: hidden;
        background-color: #f1f1f1;
    }
</style>

