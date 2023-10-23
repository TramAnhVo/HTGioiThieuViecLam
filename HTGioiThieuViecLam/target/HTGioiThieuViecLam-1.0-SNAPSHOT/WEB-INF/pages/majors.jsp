<%-- 
    Document   : major
    Created on : Jul 26, 2023, 5:07:05 PM
    Author     : Trâm Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="<c:url value="/js/main.js" />"></script>

<c:url value="/majors" var="action" />
<section class="main">
    <form:form  modelAttribute="major" method="post" enctype="multipart/form-data" action="${action}">        
        <form:hidden path="id" />
        
        <div class="form-floating mb-3 mt-5">
            <form:input type="text" class="form-control" path="name" id="name" placeholder="Tên ngành nghề" name="name" />
            <label for="name">Tên ngành nghề</label>
            <%--<form:errors path="name" element="div" cssClass="text-danger" />--%>
        </div>

        <div class="form-floating mb-3 mt-3">
            <button type="submit" class="btn btn-success">
                <c:choose>
                    <c:when test="${major.id != null}">Cập nhật ngành nghề</c:when>
                    <c:otherwise>Thêm ngành nghề</c:otherwise>
                </c:choose>
            </button>
        </div>
    </form:form>

    <table class="table table-hover mt-5">
        <thead class="table-success">
            <tr>
                <th>STT</th>
                <th>Tên ngành nghề</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${majors}" var="j">
                <tr>
                    <td>${j.id}</td>
                    <td>${j.name}</td>                                                
                    <td>
                        <c:url value="/majors/${j.id}" var="api" />
                        <a href="${api}" class="btn btn-primary" ><i class="fa-solid fa-pen-to-square"></i></a>
                        <button onclick="Xoa('${api}')" class="btn btn-danger" ><i class="fa-solid fa-trash"></i></button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
