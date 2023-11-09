    <%-- 
    Document   : job-detail
    Created on : Aug 14, 2023, 11:58:38 PM
    Author     : TramAnh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<link href="<c:url value="/css/index.css"/>" rel="stylesheet" type="text/css">

<c:url value="/jobs/${job.id}" var="action" />
<section style="margin: 2% 3%;">
    <div class="td">
        <div class="td-image">
            <img src="https://images.careerbuilder.vn/content/news/1.jpg" style="width: 100%; height: 320px" />
        </div>
        <div class="td-title">
            <div class="title">
                <h3>${job.title}</h3>
                <h5>${job.companyId.name}</h5>
            </div>


            <div class="apply">
                <se:authorize access="!isAuthenticated()">
                    <c:url value="/login" var="loginUrl" />
                    <c:set var="next" value="/formApply" />
                    <a class="btn btn-success btn-lg" href="${loginUrl}?next=${next}">Nộp đơn ứng tuyển</a>
                </se:authorize>

                <se:authorize access="hasRole('ROLE_USER')">
                    <c:url value="/jobs/${job.id}/formApply" var="Url" />
                    <a href="${Url}" class="btn btn-success btn-lg">Nộp đơn ứng tuyển</a>
                </se:authorize>
            </div>

        </div> 
    </div>

    <div class="row mt-4"  style="background: #f1f9fc">
        <div class="col-3" >
            <img src="${job.companyId.image}" class="img-thumbnail" style="width: 70%; height: 200px"/>
        </div>
        <div class="col-3">
            <div>
                <label><i class="fa-solid fa-location-dot"></i> Địa điểm</label>
                <p style="padding-left: 10px">${job.locationId.name}</p>
                <hr>
            </div>
            <div>
                <label><i class="fa-solid fa-calendar-days"></i> Ngày cập nhật</label>
                <p style="padding-left: 10px"><fmt:formatDate pattern="dd-MM-yyyy" value="${job.createDay}" /></p>
                <hr>
            </div>
            <div>
                <label><i class="fa-solid fa-briefcase"></i> Ngành nghề</label>
                <p style="padding-left: 10px">${job.majorId.name}</p>
            </div>
        </div>
        <div class="col-3">
            <div>
                <label><i class="fa-solid fa-dollar-sign"></i> Lương</label>
                <p style="padding-left: 10px">${job.salary}</p>
                <hr>
            </div>
            <div>
                <label><i class="fa-regular fa-address-book"></i> Cấp bậc</label>
                <p style="padding-left: 10px">${job.positionId.name}</p>
                <hr>
            </div>
            <div>
                <label><i class="fa-regular fa-calendar-xmark"></i> Ngày hết hạn</label>
                <p style="padding-left: 10px"><fmt:formatDate pattern="dd-MM-yyyy" value="${job.outOfDay}" /></p>
            </div>
        </div>
    </div> 
    <div class="mt-4">
        <label><h3>Mô tả công việc</h3></label>
        <p>${job.description}</p>
    </div>
    <div class="mt-4">
        <label><h3>Yêu cầu công việc</h3></label>
        <p>${job.requirement}</p>
    </div>
</section>
