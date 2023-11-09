<%-- 
    Document   : jobDetail
    Created on : Aug 5, 2023, 10:20:06 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/admin/jobs/formJobDetail" var="action" />
<section class="main">
    <h1 class="text-center text-success">THÔNG TIN CÔNG VIỆC</h1> 

    <form:form modelAttribute="job" action="${action}" method="post" enctype="multipart/form-data">
        <form:hidden path="id" />

        <div class="form-floating mb-3 mt-3">
            <form:input type="text" class="form-control" path="title" id="title" placeholder="Vị trí công việc" name="title" />
            <label for="title">Vị trí công việc</label>
            <form:errors path="title" element="div" cssClass="text-danger" />
        </div>

        <div class="form-floating mb-3 mt-3">
            <form:textarea class="form-control" id="des" name="des" path="description" placeholder="Mô tả công việc"></form:textarea>
                <label for="des">Mô tả công việc</label>
            <form:errors path="description" element="div" cssClass="text-danger" />
        </div>

        <div class="form-floating mb-3 mt-3">
            <form:textarea class="form-control tex" id="req" name="req" path="requirement" placeholder="Yêu cầu công việc"></form:textarea>
            <label for="req">Yêu cầu công việc</label>
            <form:errors path="description" element="div" cssClass="text-danger" />
        </div>

        <div class="form-floating mb-3 mt-3">
            <form:select class="form-control" type="text" path="salary" id="salary" placeholder="Lương" name="salary" >                    
                <form:option value="2-3 triệu">2-3 triệu</form:option>
                <form:option value="5-6 triệu">5-6 triệu</form:option>
                <form:option value="7-8 triệu">7-8 triệu</form:option>
                <form:option value="8-9 triệu">8-9 triệu</form:option>
                <form:option value="10-12 triệu">10-12 triệu</form:option>
                <form:option value="12-15 triệu">12-15 triệu</form:option>
                <form:option value="15-20 triệu">15-20 triệu</form:option>
                <form:option value="Lương thỏa thuận">Lương thỏa thuận</form:option>
            </form:select>
            <label for="salary"><i class="fa-solid fa-dollar-sign"></i> Lương</label>
            <%--<form:errors path="salary" element="div" cssClass="text-danger" />--%>
        </div>

        <div class="form-floating mt-3 mb-3">
            <form:input type="date" class="form-control" path="outOfDay" id="outOfDay" placeholder="Ngày Hết Hạn" name="outOfDay" />
            <label for="outOfDay" class="form-label">Ngày kết thúc</label>
        </div>

        <div class="form-floating mb-3 mt-3">
            <form:select class="form-select" id="loca" name="loca" path="locationId">
                <c:forEach items="${locations}" var="c">
                    <c:choose>
                        <c:when test="${c.id == job.locationId.id}"><option value="${c.id}" selected>${c.name}</option></c:when>
                        <c:otherwise><option value="${c.id}">${c.name}</option></c:otherwise>
                    </c:choose>

                </c:forEach>
            </form:select>
            <label for="loca" class="form-label">Nơi làm việc</label>
        </div>   

        <div class="form-floating mb-3 mt-3">
            <form:select class="form-select" id="compa" name="compa" path="companyId">
                <c:forEach items="${companies}" var="c">
                    <c:choose>
                        <c:when test="${c.id == job.companyId.id}"><option value="${c.id}" selected>${c.name}</option></c:when>
                        <c:otherwise><option value="${c.id}">${c.name}</option></c:otherwise>
                    </c:choose>

                </c:forEach>
            </form:select>
            <label for="compa" class="form-label">Doanh nghiệp</label>
        </div>  

        <div class="form-floating mb-3 mt-3">
            <form:select class="form-select" id="majorId" name="majorId" path="majorId">
                <c:forEach items="${majors}" var="c">
                    <c:choose>
                        <c:when test="${c.id == job.majorId.id}"><option value="${c.id}" selected>${c.name}</option></c:when>
                        <c:otherwise><option value="${c.id}">${c.name}</option></c:otherwise>
                    </c:choose>

                </c:forEach>
            </form:select>
            <label for="compa" class="form-label">Ngành nghề</label>
        </div>

        <div class="form-floating mb-3 mt-3">
            <form:select class="form-select" id="positionId" name="positionId" path="positionId">
                <c:forEach items="${positions}" var="c">
                    <c:choose>
                        <c:when test="${c.id == job.positionId.id}"><option value="${c.id}" selected>${c.name}</option></c:when>
                        <c:otherwise><option value="${c.id}">${c.name}</option></c:otherwise>
                    </c:choose>

                </c:forEach>
            </form:select>
            <label for="positionId" class="form-label">Cấp bậc</label>
        </div>

        <div class="form-floating mb-3 mt-3">
            <form:select class="form-control" type="text" path="experience" id="experience" placeholder="Kinh nghiệm" name="experience" >                    
                <form:option value="Không yêu cầu kinh nghiệm">Không yêu cầu kinh nghiệm</form:option>
                <form:option value="6 tháng">6 tháng</form:option>
                <form:option value="1 năm">1 năm</form:option>
                <form:option value="2 năm">2 năm</form:option>
                <form:option value="3 năm">3 năm</form:option>
                <form:option value="Dưới 1 năm">Dưới 1 năm</form:option>
                <form:option value="Từ 2-5 năm">Từ 2-5 năm</form:option>
                <form:option value="Trên 5 năm">Trên 5 năm</form:option>
            </form:select>
            <label for="experience"><i class="fa-solid fa-clipboard"></i> Kinh nghiệm</label>
            <%--<form:errors path="salary" element="div" cssClass="text-danger" />--%>
        </div>

        <div class="form-floating mb-3 mt-3">
            <button type="submit" class="btn btn-success">
                <c:choose>
                    <c:when test="${job.id != null}">Cập nhật công việc</c:when>
                    <c:otherwise>Thêm công việc</c:otherwise>
                </c:choose>
            </button>
        </div>
    </form:form>
</section>

<style>
    #req, #des {
        height: 100px;
    }
</style>
