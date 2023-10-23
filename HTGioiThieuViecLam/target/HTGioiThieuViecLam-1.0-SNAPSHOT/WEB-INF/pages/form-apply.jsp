<%-- 
    Document   : form-apply
    Created on : Aug 19, 2023, 10:40:17 AM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/jobs/${job.id}/formApply" var="action" />

<section>
    <form:form cssClass="conatiner dk" modelAttribute="cv" action="${action}" method="post" enctype="multipart/form-data">
        <h2 class="mt-2 text-center text-success">ỨNG TUYỂN VIỆC LÀM</h2>

        <div class="mb-3 mt-3">
            <label for="text" class="form-label">Vị trí công việc</label>
            <input type="text" class="form-control" placeholder="${job.title}" disabled>
        </div>

        <div class="mb-3 mt-3">
            <label for="text" class="form-label">Doanh nghiệp</label>
            <input type="text" class="form-control" placeholder="${job.companyId.name}" disabled>
        </div>

        <div class="mb-3 mt-3">
            <label for="text" class="form-label"><i class="fa-regular fa-address-book"></i> Hình thức làm việc</label>
            <input type="text" class="form-control" placeholder="${job.positionId.name}" disabled>
        </div>

        <div class="mb-3 mt-3">
            <label for="text" class="form-label"><i class="fa-solid fa-briefcase"></i> Ngành nghề</label>
            <input type="text" class="form-control" placeholder="${job.majorId.name}" disabled>
        </div>

        <div class="mb-3 mt-3">
            <label for="text" class="form-label">Nội dung gửi đến doanh nghiệp</label>
            <form:textarea class="form-control tex" id="content" name="content" path="content" placeholder="Nội dung muốn gửi đến doanh nghiệp..."></form:textarea>
            </div>

            <div class="mb-3 mt-3">
                <label for="file"><i class="fa-solid fa-image"></i>File CV</label>
            <form:input type="file" class="form-control" id="file" 
                        path="file" name="file" />
        </div>

        <button type="submit" class="container btn btn-success mb-2">Ứng tuyển</button>
    </form:form>
</section>


<style>
    body {
        background-color: #f3f5f7;
    }
    .dk {
        margin: 1% 20%;
        padding: 2%;
        border: 2px solid white;
        width: 60%;
        background-color: white;
    }
    i{
        color: green;
    }
    label {
        ;
        font-weight: 700;
    }
    #content {
        height: 80px;
    }
</style>


