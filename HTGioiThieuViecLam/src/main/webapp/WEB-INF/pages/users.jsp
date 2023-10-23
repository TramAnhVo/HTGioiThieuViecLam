<%-- 
    Document   : users
    Created on : Jul 31, 2023, 9:27:55 AM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="<c:url value="/js/main.js" />"></script>

<c:url value="/users" var="action" />

<section class="main">

    <a href="<c:url value="/admin/users/formUser" />" class="btn btn-success mt-3" >Thêm tài khoản</a>

    <table class="table table-hover mt-5">
        <thead class="table-success">
            <tr>
                <th></th>
                <th>Họ tên</th>
                <th>Giới tính</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <th>Vai trò</th>
                <th>Trạng thái</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userInfo}" var="u">
                <tr>
                    <td>
                        <img src="${u.avatar}" style="width: 100px">
                    </td>
                    <td>${u.firstName} ${u.lastName}</td>
                    <td>${u.gender}</td>   
                    <td>${u.phone}</td>
                    <td>${u.email}</td>

                    <c:if test="${u.userRole == 'ROLE_EMPLOYER'}" >
                        <td>Nhà tuyển dụng</td>
                    </c:if>

                    <c:if test="${u.userRole == 'ROLE_USER'}" >
                        <td>Người ứng tuyển</td>
                    </c:if>

                    <c:if test="${u.userRole == 'ROLE_ADMIN'}" >
                        <td>Người quản trị</td>
                    </c:if>

                    <c:if test="${u.active == true}" >
                        <td><i class="fa-solid fa-circle-check" style="color: green; font-size: 20px"></i></td>
                        </c:if>

                    <c:if test="${u.active == false}" >
                        <td><i class="fa-solid fa-circle-xmark" style="color: red"></i></td>
                        </c:if>

                    <c:if test="${u.userRole == 'ROLE_USER' || u.userRole == 'ROLE_EMPLOYER'}" >
                        <td>
                            <c:url value="/admin/users/formUser/${u.id}" var="api" />
                            <button><a href="${api}"><i class="fa-solid fa-pen-to-square"></i></a></button>                           
                            <button onclick="Xoa('${api}')"><i class="fa-solid fa-trash" style="color: red"></i></button>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
