<%-- 
    Document   : index-job
    Created on : Aug 15, 2023, 7:43:13 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/indexJob" var="action" />
<section class="d-flex" style="justify-content: center; background-color: #F2F2F2; padding: 1%">  
    
    <div class="dropdown dropdown-menu-end">
        <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
            <i class="fa-solid fa-building"></i> Doanh nghiệp
        </button>
        <ul class="dropdown-menu">
            <c:forEach items="${companies}" var="c">
                <c:url value="/indexJob" var="searchUrl">
                    <c:param name="companyId" value="${c.id}" />
                </c:url>
                <li>
                    <a class="dropdown-item" href="${searchUrl}">${c.name}</a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <div class="dropdown dropdown-menu-end">
        <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
            <i class="fa-solid fa-location-dot"></i> Địa điểm
        </button>
        <ul class="dropdown-menu">
            <c:forEach items="${locations}" var="c">
                <c:url value="/indexJob" var="searchUrl">
                    <c:param name="locationId" value="${c.id}" />
                </c:url>
                <li>
                    <a class="dropdown-item" href="${searchUrl}">${c.name}</a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <div class="dropdown dropdown-menu-end">
        <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
            <i class="fa-solid fa-briefcase"></i> Ngành nghề
        </button>
        <ul class="dropdown-menu">
            <c:forEach items="${majors}" var="c">
                <c:url value="/indexJob" var="searchUrl">
                    <c:param name="majorId" value="${c.id}" />
                </c:url>
                <li>
                    <a class="dropdown-item" href="${searchUrl}">${c.name}</a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <div class="dropdown dropdown-menu-end">
        <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
            <i class="fa-regular fa-address-book"></i> Cấp bậc
        </button>
        <ul class="dropdown-menu">
            <c:forEach items="${positions}" var="c">
                <c:url value="/indexJob" var="searchUrl">
                    <c:param name="positionId" value="${c.id}" />
                </c:url>
                <li>
                    <a class="dropdown-item" href="${searchUrl}">${c.name}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
</section>

<section style="margin: 0 2%">    
    <div>
        <h2>${counters} việc làm </h2>
        <hr>
    </div>

    <div class="row">
        <c:forEach items="${jobs}" var="j">
            <c:url value="/jobs/${j.id}" var="detail" />
            <div class="item">
                <div class="col-img">
                    <img src="${j.companyId.image}" alt="${j.title}">
                </div>

                <div class="col-title">                   
                    <p class="mb-1" style="font-weight: 700"><a href="${detail}">${j.title}</a></p>
                    <p class="mb-1"><a href="${detail}">${j.companyId.name}</a></p>
                    <p class="mb-1 text-success">${j.salary}</p>
                    <p class="mb-1">${j.locationId.name}</p>
                </div>
            </div>
        </c:forEach>      
    </div>


    <!--phan trang-->
    <c:if test="${counter > 1}">
        <ul class="pagination justify-content-center mt-3">
            <li class="page-item"><a class="page-link" href="${action}">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/indexJob" var="pageUrl">
                        <c:param name="page" value="${i}" />
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>


</section>

