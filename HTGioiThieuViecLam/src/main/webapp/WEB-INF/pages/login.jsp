<%-- 
    Document   : login
    Created on : Aug 12, 2023, 9:45:44 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/login" var="action" />

<section class="container">
    <div class="row container" >
        <div class="col-50">
            <img src="https://res.cloudinary.com/dfhexl1gh/image/upload/v1691932540/vecteezy_isometric-style-illustration-of-login-to-website_6552114_g7bp2s.jpg" />
        </div>
        <div class="col-50" style="margin-top: 8%; padding-right: 8%">
            <form method="post" action="${action}">
                <h3 class="text-center text-success">ĐĂNG NHẬP TÀI KHOẢN</h3>

                <div class="form-floating mb-3 mt-3">
                    <input type="text" class="form-control" id="username" placeholder="Tên đăng nhập" name="username">
                    <label for="email"><i class="fa-solid fa-user"></i> Tên đăng nhập</label>
                </div>

                <div class="form-floating mt-3 mb-2">
                    <input type="password" class="form-control" id="pwd" placeholder="Mật khẩu" name="password">
                    <label for="pwd"><i class="fa-solid fa-key"></i> Mật khẩu</label>
                </div>
                
                <input type="hidden" name="next" value="${next}" />
                <input type="submit" value="Đăng nhập" class="btn btn-success container mt-2 mb-3" />

                <h5 class="text-center mt-3 mb-3">Bạn chưa có tài khoản? <a class="text-danger dn" href="<c:url value="/register" />">Đăng ký ngay!</a></h5>
                
                <h5 class="text-center"><a class="text-info dn" href="<c:url value="/" />">Về trang chủ</a></h5>
            </form>
        </div>
    </div>
</section>

<style>
    section {
        background-color: white;
        margin-top: 7%;
        margin-bottom: 7%;
    }
    
    body {
        background-color: #f3f5f7;
    }

    .row {
        display: flex;
    }

    .col-50 {
        width: 50%;
    }
    .col-50 > img {
        width: 100%;
    }

    .dn  {
        text-decoration: none;
    }
</style>




