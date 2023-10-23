<%-- 
    Document   : form-user
    Created on : Sep 27, 2023, 12:02:45 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

<c:url value="/admin/users/formUser" var="action" />

<section class="main">
    <form:form cssClass="conatiner dk" modelAttribute="user" action="${action}" method="post" enctype="multipart/form-data">
        <h2 class="mt-3 text-center text-success">THÔNG TIN TÀI KHOẢN</h2>
        <form:hidden path="id" />
        <form:hidden path="avatar" />
        
        <div class="form-floating mt-2 col-50" style="padding-left: 0">
            <form:input type="text" class="form-control" path="firstName" id="firstName" placeholder="Họ" name="firstName" />
            <label for="firstName" style="padding: 20px">Họ tài khoản</label>
            <%--<form:errors path="title" element="div" cssClass="text-danger" />--%>
        </div>

        <div class="form-floating mt-2 col-50">
            <form:input type="text" class="form-control" path="lastName" id="lastName" placeholder="Tên" name="lastName" />
            <label for="lastName" style="padding: 20px">Tên tài khoản</label>
            <%--<form:errors path="title" element="div" cssClass="text-danger" />--%>
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
                        <c:when test="${c.id == user.locationId.id}"><option value="${c.id}" selected>${c.name}</option></c:when>
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

            <c:if test="${user.avatar != null}">
                <img src="${user.avatar}" width="120" />
            </c:if>
        </div>

        <div class="form-floating mb-2 mt-2" onclick="load()"">
            <form:select class="form-select" id="userRole" name="userRole" path="userRole">
                <form:option value="ROLE_USER">Người ứng tuyển</form:option>
                <form:option value="ROLE_EMPLOYER">Nhà tuyển dụng</form:option>   
            </form:select>
            <label for="userRole" class="form-label"><i class="fa-solid fa-circle-user"></i> Loại người dùng</label>
        </div>

        <div class="form-floating mb-3 mt-3">
            <button type="submit" class="btn btn-success container btn-lg">
                <c:choose>
                    <c:when test="${user.id != null}">Cập nhật thông tin tài khoản</c:when>
                    <c:otherwise>Đăng kí tài khoản</c:otherwise>
                </c:choose>
            </button>
        </div>
    </form:form>
</section>


