<%-- 
    Document   : quarter-stats
    Created on : Sep 10, 2023, 4:49:38 PM
    Author     : TramAnh
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/admin/quarterStats" var="action" />
<h1 class="text-center text-primary mt-3">THỐNG KÊ ỨNG TUYỂN THEO NGÀNH NGHỀ TRONG QUÝ</h1>


<form action="${action}" class="d-flex searchStats container mt-3">
    <select class="form-control" name="quarter">
        <option selected disabled>Chọn quý</option>
        <c:forEach begin="1" end="4" var="i">
            <option value="${i}">${i}</option>
        </c:forEach>
    </select>
    
    <input type="number" class="form-control" placeholder="Nhập năm..." name="year">
    
    <button type="submit" class="btn btn-primary">Lọc dữ liệu</button>
</form>
    
    <div class="row" style="margin: 4% 5%">
    <div class="col-md-5 col-xs-12">
        <h2 class="section-title2 section-title-center">
            <b></b>
            <span class="section-title-main" style="color:rgb(210, 80, 0);">
                BẢNG ỨNG TUYỂN THEO QUÝ
            </span>
            <b></b>
        </h2>
        <table class="table stats">
            <tr>
                <th class="id">Mã</th>
                <th>Ngành nghề</th>
                <th>Số lượng CV</th>
            </tr>
            <c:forEach items="${quarterStats}" var="c">
                <tr>
                    <td>${c[0]}</td>
                    <td>${c[1]}</td>
                    <td>${c[2]}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-7 col-xs-12">
        <h2 class="section-title2 section-title-center">
            <b></b>
            <span class="section-title-main" style="color:rgb(210, 80, 0);">
                BIỂU ĐỒ ỨNG TUYỂN THEO QUÝ
            </span>
            <b></b>
        </h2>
        <div class="canvasStats">
            <canvas id="myRevenueChart"></canvas>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>
     let data1 = [], label1 = [];
    <c:forEach items="${quarterStats}" var="c">
    label1.push('${c[1]}');
    data1.push(${c[2]});
    </c:forEach>

    window.onload = function () {
        drawChart(data1, label1, "Số lượng", "bar", "myRevenueChart");
    }
</script>

<style>
    .form-control {
        width: 30%;
        height: 60px;
        margin-right: 1%;
    }
</style>