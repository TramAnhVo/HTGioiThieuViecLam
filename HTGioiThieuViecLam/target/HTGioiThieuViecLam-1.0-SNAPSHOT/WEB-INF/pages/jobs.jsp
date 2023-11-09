<%-- 
    Document   : jobs
    Created on : Jul 30, 2023, 8:45:39 AM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="se" uri="http://www.springframework.org/security/tags"  %>
<script src="<c:url value="/js/main.js" />"></script>

<c:url value="/admin/jobs" var="action" />

<se:authorize access="hasRole('ROLE_ADMIN')">
    <section class="main">
        <div class="row mt-4 mb-3">
            <div class="col">
                <a class="btn btn-success p-2" href="<c:url value="/admin/jobs/formJobDetail" />">Thêm công việc</a>
            </div>

            <!--phan trang-->
            <div class="col">
                <c:if test="${counter > 1}">
                    <ul class="pagination justify-content-end">
                        <li class="page-item"><a class="page-link" href="${action}">Tất cả</a></li>
                            <c:forEach begin="1" end="${counter}" var="i">
                                <c:url value="/admin/jobs" var="pageUrl">
                                    <c:param name="page" value="${i}" />
                                </c:url>
                            <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
                            </c:forEach>
                    </ul>
                </c:if>
            </div>
        </div>

        <table class="table table-hover">
            <thead class="table-success">
                <tr>
                    <th></th>
                    <th>Vị trí công việc</th>
                    <th>Doanh nghiệp</th>
                    <th>Khu vực</th>
                    <th>Ngày bắt đầu</th>
                    <th>Ngày hết hạn</th>
                    <th>Lương</th>
                    <th>Hình thức làm việc</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${jobs}" var="j">
                    <tr>
                        <td>
                            <img src="${j.companyId.image}" alt="${j.title}" width="120" />
                        </td>
                        <td>${j.title}</td>
                        <td>${j.companyId.name}</td>
                        <td>${j.locationId.name}</td>                           
                        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${j.createDay}" /></td>  
                        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${j.outOfDay}" /></td>
                        <td>${j.salary}</td>
                        <td>${j.positionId.name}</td>                           
                        <td>
                            <c:url value="/admin/jobs/formJobDetail/${j.id}" var="api" />
                            <a href="${api}" class="btn btn-primary">Chỉnh sửa</a>
                            <button class="btn btn-danger mt-2" onclick="Xoa('${api}')">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
</se:authorize>

<se:authorize access="hasRole('ROLE_EMPLOYER')">
    <style>
        nav {visibility: hidden}
        .emp {
            margin: 2% 10%;
        }
    </style>
    
    <section class="emp">
        <div class="row mt-4 mb-3">
            <div class="col">
                <a class="btn btn-success p-2" href="<c:url value="/employer/formJob" />">Đăng bài tuyển dụng </a>
            </div>

        <table class="table table-hover mt-2">
            <thead class="table-success">
                <tr>
                    <th></th>
                    <th>Vị trí công việc</th>
                    <th>Doanh nghiệp</th>
                    <th>Khu vực</th>
                    <th>Ngày bắt đầu</th>
                    <th>Ngày hết hạn</th>
                    <th>Lương</th>
                    <th>Hình thức làm việc</th>
                    <th></th>
                </tr>
            </thead>
            
            <tbody>
                <c:forEach items="${jobsC}" var="j">
                    <tr>
                        <td>
                            <img src="${j.companyId.image}" alt="${j.title}" width="120" />
                        </td>
                        <td>${j.title}</td>
                        <td>${j.companyId.name}</td>
                        <td>${j.locationId.name}</td>                           
                        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${j.createDay}" /></td>  
                        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${j.outOfDay}" /></td>
                        <td>${j.salary}</td>
                        <td>${j.positionId.name}</td> 
                        <td>
                            <c:url value="/employer/jobs/formJob/${j.id}" var="api" />
                            <a href="${api}" class="btn btn-primary">Chỉnh sửa</a>
                            <button class="btn btn-danger" onclick="Xoa('${api}')">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
</se:authorize>
