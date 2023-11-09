<%-- 
    Document   : company-detail
    Created on : Sep 6, 2023, 8:34:39 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="<c:url value="/css/index.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/company-detail.css"/>" rel="stylesheet" type="text/css">

<div class="blog-single gray-bg">
    <div class="container">
        <div class="row align-items-start">
            <div class="col-lg-8 m-15px-tb">
                <article class="article">

                    <div class="article-img">
                        <img src="${company.image}" class="img-thumbnail" style="width: 100%; height: 230px"/>
                    </div>

                    <div class="article-title">                           
                        <h2 class="mt-3">${company.name}</h2>
                        <P><i class="fa-solid fa-location-dot"></i> Địa chỉ doanh nghiệp: 
                            <span>${company.address}</span>
                        </P>
                    </div>
                    <div class="article-content">
                        <h4><i class="fa-solid fa-book"></i> Giới thiệu công ty</h4>
                        <p>${company.description}</p>
                    </div>
                </article>

                <se:authorize access="hasRole('ROLE_USER')">      
                    <div class="contact-form article-comment">
                        <h4><i class="fa-solid fa-comment"></i> Bình luận về doanh nghiệp</h4>
                        <se:authorize access="!isAuthenticated()">
                            <a href="<c:url value="/login" />" class="btn btn-block btn-primary">Đăng nhập để bình luận</a>
                        </se:authorize>
                        <se:authorize access="isAuthenticated()">
                            <form:form cssclass="row clearfix" modelAttribute="cmt" action="${action}" method="post" enctype="multipart/form-data">
                                <div class="col-md-12 ">
                                    <div class="form-group">
                                        <form:textarea rows="3" class="form-control no-resize" id="content" name="content"
                                                       path="content" placeholder="Please type what you want..."></form:textarea>
                                        </div>
                                    </div>  
                                    <div class="col-md-12">
                                        <div class="send">
                                            <button type="submit" class="px-btn theme"><span>Bình luận</span> <i class="arrow"></i></button>
                                        </div>
                                    </div>
                            </form:form>
                        </se:authorize>
                    </div>
                </se:authorize>  

                <div class="contact-form article-comment mt-4">
                    <h4><i class="fa-solid fa-comments"></i> Bình luận về doanh nghiệp</h4>
                    <c:forEach items="${cmts}" var="c">
                        <div class="be-comment">
                            <div class="be-img-comment">	
                                <img src="${c.userId.avatar}" alt="" class="be-ava-comment">
                            </div>
                            <div class="be-comment-content">
                                <span class="be-comment-name" style="font-size: 16px">
                                    ${c.userId.username}
                                </span>
                                <span class="be-comment-time">
                                    <i class="fa fa-clock-o"></i>
                                    <fmt:formatDate pattern="dd-MM-yyyy" value="${c.createDay}" />
                                </span>
                                <p class="be-comment-text">
                                    ${c.content}
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-lg-4 m-15px-tb blog-aside">
                <!-- Author -->
                <div class="widget widget-author">
                    <div class="widget-title">
                        <h3><i class="fa-solid fa-building"></i> Thông tin chi tiết doanh nghiệp</h3>
                    </div>
                    <div class="widget-body" style="font-size: 18px">
                        <p style="font-size: 16px"><i class="mt-2 mb-2 fa-solid fa-envelope"></i> Email: ${company.email}</p>
                        <p><i class="mt-2 mb-2 fa-solid fa-calendar-days"></i> Năm thành lập: ${company.establish}</p>
                        <p><i class="mt-2 mb-2 fa-solid fa-link"></i> ${company.link}</p>
                    </div>
                </div>

                <div class="widget widget-latest-post">
                    <div class="widget-title">
                        <h3>Bài đăng công viên gần đây</h3>
                    </div>

                    <div class="widget-body">
                        <c:set var="cout" value="0"/>
                        <c:forEach items="${job}" var="j">
                            <c:if test="${cout < 5}">

                                <div class="latest-post-aside media">
                                    <li class="row clearfix">
                                        <div class="icon-box col-md-2 col-4">
                                            <img src="${company.image}" alt="${j.title} ">
                                        </div>
                                        <div class="text-box col-md-10 col-8 p-l-0 p-r0">
                                            <a href="<c:url value="/jobs/${j.id}"/>" style="text-decoration: none; color: black">
                                                <h5 class="m-b-0">${j.title} </h5>
                                            </a>
                                            <p style="margin-bottom: 5px" >Địa điểm làm việc: ${j.locationId.name}</p> 
                                            <p>Ngày đăng: <fmt:formatDate pattern="dd-MM-yyyy" value="${j.createDay}"/></p>
                                        </div>
                                    </li>    
                                </div>

                                <c:set var="cout" value="${cout+1}"/>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
