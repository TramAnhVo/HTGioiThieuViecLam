<%-- 
    Document   : index
    Created on : Jul 12, 2023, 10:57:37 PM
    Author     : Trâm Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value="/css/index.css"/>" rel="stylesheet" type="text/css">

<c:url value="/" var="action" />
<section>
    <!-- Carousel -->
    <div id="demo" class="carousel slide" data-bs-ride="carousel">

        <!-- Indicators/dots -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
        </div>

        <!-- The slideshow/carousel -->
        <div class="carousel-inner">
            <div class="carousel-item active">   
                <img src="https://res.cloudinary.com/dfhexl1gh/image/upload/v1691425806/pdjmslkpexc3rqyhcqlx.png" alt="anh_bia" class="d-block" style="width:100%">
            </div>
            <div class="carousel-item">
                <img src="https://images.careerbuilder.vn/background/cb-share-cv-profile-banner_plb_desktop_1900x570_2022_01_25_1643100421.jpg" alt="anh_bia_1" class="d-block" style="width:100%">
            </div>
            <div class="carousel-item">
                <img src="https://res.cloudinary.com/dfhexl1gh/image/upload/v1694253921/Thi%E1%BA%BFt_k%E1%BA%BF_ch%C6%B0a_c%C3%B3_t%C3%AAn_r2aqiw.png" alt="anh_bia_1" class="d-block" style="width:100%">
            </div>
        </div>

        <!-- Left and right controls/icons -->
        <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>
</section>

<section class="mb-5 container mt-5 ">
    <div>
        <h2 class="text-success mb-3">TOP CÔNG TY HÀNG ĐẦU</h2>
    </div>

    <div class="row" style="justify-content: space-between">
        <c:forEach begin="0" end="4" items="${companies}" var="c">
            <c:url value="/companies/${c.id}" var="detail" />
            <div class="card">
                <img src="${c.image}" alt="${c.name}" style="width:100%; height: 150px">
                <h5 class="mt-3 mb-3" style="margin-bottom: 5%; height: 70px">
                    <a href="${detail}" style="text-decoration: none; color: black; font-weight: 700">${c.name}</a>
                </h5>
                <a class="btn btn-success" href="${detail}" style="font-size:18px" >Xem chi tiết</a>
            </div>
        </c:forEach>
    </div>
</section>

<section class="mb-5 mt-5 container">
    <div>
        <h2 class="text-success mb-3">TOP CÔNG VIỆC HÀNG ĐẦU</h2>
    </div>

    <div class="row">
        <c:forEach begin="0" end="7" items="${jobs}" var="j">
            <c:url value="/jobs/${j.id}" var="detail"/>
            <div class="item">
                <div class="col-img">
                    <img src="${j.companyId.image}" alt="${j.title}">
                </div>

                <div class="col-title">                   
                    <p class="mb-1" style="font-weight: 700"><a href="${detail}">${j.title}</a></p>
                    <p class="mb-1"><a>${j.companyId.name}</a></p>
                    <p class="mb-1 text-success">${j.salary}</p>
                    <p class="mb-1">${j.locationId.name}</p>
                </div>
            </div>
        </c:forEach>      
    </div>
</section>

<section class="container mt-5 mb-5">
    <div>
        <h2 class="text-success">TOP NGÀNH NGHỀ NỔI BẬT</h2>
    </div>

    <div class="row mt-3">
        <c:forEach items="${majors}" var="m" >
            <c:url value="/indexJob" var="searchUrl">
                <c:param name="majorId" value="${m.id}" />
            </c:url>            
                <div class="col-2">
                    <a href="${searchUrl}" style="text-decoration: none">
                    <div class="image container">
                        <img class="img1" src="${m.image}" />
                    </div>

                        <h5 class="text-center" style="color: black" >${m.name}</h5>
                    </a>
                </div>            
        </c:forEach>
    </div>
</section>



