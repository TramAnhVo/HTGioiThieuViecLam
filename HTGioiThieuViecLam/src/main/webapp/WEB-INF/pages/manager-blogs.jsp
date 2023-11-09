<%-- 
    Document   : manager-Blogs
    Created on : Nov 6, 2023, 4:27:22 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="<c:url value="/js/main.js" />"></script>

<style>
    .bl{
        height: 100px;
        width: 100%;
        margin-top: 2%;
    }
</style>

<c:url value="/admin/manageBlog" var="action" />

<section class="main">
    <form:form modelAttribute="blog" method="post" action="${action}" enctype="multipart/form-data">
        <form:textarea class="bl m-control" id="content" name="content" path="content" placeholder="Bạn muốn viết gì?"></form:textarea>
        </div> 

        <div class="form-floating mb-3 mt-2 container">
            <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${blog.id != null}">Cập nhật</c:when>
                <c:otherwise>Đăng bài</c:otherwise>
            </c:choose>
        </button>
    </form:form>

    <table class="table table-hover mt-5">
        <thead class="table-success">
            <tr>
                <th>STT</th>
                <th>Tên ngành nghề</th>
                <th>Họ tên người đăng</th>
                <th>Ngày đăng tin</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${blogs}" var="j">
                <tr>
                    <td>${j.id}</td>
                    <td>${j.content}</td>
                    <td>${j.userId.firstName} ${j.userId.lastName}</td>
                    <td><fmt:formatDate pattern="dd-MM-yyyy" value="${j.createdDay}" /></td>
                    <td>
                        <c:url value="/admin/manageBlog/${j.id}" var="api" />
                        <button onclick="Xoa('${api}')" class="btn btn-danger" ><i class="fa-solid fa-trash"></i></button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>