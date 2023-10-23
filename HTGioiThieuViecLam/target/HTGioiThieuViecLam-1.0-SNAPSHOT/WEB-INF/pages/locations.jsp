<%-- 
    Document   : location
    Created on : Jul 26, 2023, 5:07:12 PM
    Author     : Trâm Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="<c:url value="/js/main.js" />"></script>

<c:url value="/locations" var="action" />
<section class="main">
    <form:form  modelAttribute="location" method="post" enctype="multipart/form-data" action="${action}">
        <form:hidden path="id" />
        
        <div class="form-floating mb-3 mt-5">
            <form:input type="text" class="form-control" path="name" id="name" placeholder="Tên địa phương" name="name" />
            <label for="name"><i class="fa-solid fa-location-dot"></i> Tên khu vực</label>
            <form:errors path="name" element="div" cssClass="text-danger" />
        </div>       

        <div class="form-floating mb-3 mt-3">
            <button type="submit" class="btn btn-success">
                <c:choose>
                    <c:when test="${location.id != null}">Cập nhật khu vực</c:when>
                    <c:otherwise>Thêm khu vực</c:otherwise>
                </c:choose>
            </button>
        </div>
    </form:form>

    <table class="table table-hover mt-5">
        <thead class="table-success">
            <tr>
                <th>STT</th>
                <th><i class="fa-solid fa-location-dot"></i> Tên khu vực</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${locations}" var="j">
                <tr>
                    <td>${j.id}</td>
                    <td>${j.name}</td>                                                
                    <td>
                        <c:url value="/locations/${j.id}" var="api" />
                        <a href="${api}" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></a>
                        <button class="btn btn-danger" onclick="Xoa('${api}')"><i class="fa-solid fa-trash"></i></button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
