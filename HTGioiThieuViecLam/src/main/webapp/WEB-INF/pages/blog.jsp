<%-- 
    Document   : blog
    Created on : Sep 24, 2023, 7:41:08 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value="/css/blog.css"/>" rel="stylesheet" type="text/css">
<c:url value="/blog" var="action" />

<style>
    #content {
        height: 150px;
    }
</style>

<div class="mt-4 mb-4">
    
    <form:form modelAttribute="blog" method="post" action="${action}" enctype="multipart/form-data">
        <div class="form-floating mb-3 mt-3 container">
            <form:textarea class="form-control" id="content" name="content" path="content" placeholder="Bạn muốn viết gì?"></form:textarea>
            <label style="margin-left: 10px">Bạn đang nghĩ gì? ....</label>
        </div> 

        <div class="form-floating mb-3 mt-3 container">
            <button type="submit" class="btn btn-primary">
                <c:choose>
                    <c:when test="${blog.id != null}">Cập nhật</c:when>
                    <c:otherwise>Đăng bài</c:otherwise>
                </c:choose>
            </button>
        </div>
    </form:form>
</div>

<div class="container bootstrap snippets bootdey">
    <div class="row mt-4">       
        <c:forEach items="${blogs}" var="b">
        <div class="col-md-6 col-sm-6 col-xs-12">
            <section class="widget">
                <div class="widget-body">
                    
                    <div class="post-user mt-n-xs">
                        <span class="thumb pull-left mr">
                            <img class="img-circle" src="${b.userId.avatar}" alt="...">
                        </span>
                        <h5 class="mb-xs mt-xs">${b.userId.username}</h5>
                        <p class="fs-mini text-muted"><time>${b.createdDay}</time> &nbsp; <i class="fa fa-map-marker"></i> ${b.userId.locationId.name}</p>
                    </div>
                    
                    <div class="widget-middle-overflow windget-padding-md clearfix bg-danger text-white">
                        <h3 class="mt-lg mb-lg">${b.content}</h3>
                    </div>
                    <p class="text-light fs-mini mt-sm"></p>
                </div>
                
            </section>
        </div>
        </c:forEach>
    </div>
</div>

<script>
    
    
    // Lấy tham chiếu đến phần tử div
    var divElement = document.getElementById("myDiv");

    // Đổi màu sắc của div thành màu xanh lá cây
    divElement.style.backgroundColor = "green";
</script>
