<%-- 
    Document   : manage-cv
    Created on : Aug 28, 2023, 9:15:11 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="<c:url value="/js/main.js" />"></script>
<link href="<c:url value="/css/index.css"/>" rel="stylesheet" type="text/css">

<h2 class="text-center text-success mt-5 mb-3">QUẢN LÍ HỒ SƠ ỨNG TUYỂN</h2>

<div class="bootstrap snippets bootdey" style="margin: 2% 3%">
    <c:forEach items="${jobCompa}" var="j">
        <div class="row">
            <div class="col-sm-3">
                <ul class="list-group">
                    <li class="list-group-item text-muted">Thông tin công việc</li>
                    <li class="list-group-item text-right">
                        <span class="pull-left">Vị trí: <strong>${j.title}</strong></span></li>
                    <li class="list-group-item text-right">
                        <span class="pull-left">Lương: <strong>${j.salary}</strong></span></li>
                    <li class="list-group-item text-right">
                        <span class="pull-left">Ngày đăng bài: <strong><fmt:formatDate pattern="dd-MM-yyyy" value="${j.createDay}" /></strong></span></li>
                </ul>
            </div>

            <div class="col-sm-9">
                <div class="tab-content">
                    <div class="tab-pane active" id="home">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead class="table-primary">
                                    <tr>
                                        <th>STT</th>
                                        <th><i class="fa-solid fa-user"></i> Họ tên ứng viên</th>
                                        <th><i class="fa-solid fa-envelope"></i> Email</th>
                                        <th><i class="fa-solid fa-phone"></i> Số điện thoại</th>
                                        <th><i class="fa-solid fa-file"></i> Cv</th>
                                        <th><i class="fa-solid fa-calendar-days"></i> Ngày nộp cv</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${cvs}" var="c">
                                    <c:if test="${c.jobId.id == j.id}">
                                        <tbody id="items">
                                            <tr>
                                                <td>${c.id}</td>
                                                <td>${c.userId.firstName} ${c.userId.lastName}</td>
                                                <td>${c.userId.email}</td>
                                                <td>${c.userId.phone}</td>
                                                <td>
                                                    <img class="myImg" src="${c.cv}" alt="Image 2" style="width: 60px; height: 60px">
                                                    <div id="myModal" class="modal">
                                                        <span class="close">&times;</span>
                                                        <img class="modal-content" id="img01">
                                                    </div>
                                                </td>
                                                <td><fmt:formatDate pattern="dd-MM-yyyy" value="${c.dayApply}" /></td>

                                                <c:if test="${c.active == true}" >
                                                    <td>Đã duyệt</td>
                                                </c:if>

                                                <c:if test="${c.active == false}" >  
                                                    <td>
                                                        <c:url value="/employer/manageCv/${c.id}" var="api" />
                                                        <button id="btn-hide" class="btn btn-success" id="myButton" onclick="updateActive('${api}')">Duyệt cv</button>
                                                        <div class="spinner-border" id="loadingOverlay" style="display: none"></div>
                                                    </td> 
                                                </c:if>
                                            </tr>
                                        </tbody>
                                    </c:if>
                                </c:forEach> 
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
    </c:forEach>      
</div>


<script>
// Get the modal
    var modals = document.getElementsByClassName("modal");
    var imgs = document.getElementsByClassName("myImg");
    var modalImgs = document.getElementsByClassName("modal-content");
    for (var i = 0; i < imgs.length; i++) {
        imgs[i].addEventListener("click", function () {
            var modal = this.nextElementSibling;
            modal.style.display = "block";
            modal.querySelector(".modal-content").src = this.src;
        });
    }

// Get the <span> element that closes the modal
    var spans = document.getElementsByClassName("close");
    for (var i = 0; i < spans.length; i++) {
        spans[i].addEventListener("click", function () {
            var modal = this.parentNode;
            modal.style.display = "none";
        });
    }
</script>
