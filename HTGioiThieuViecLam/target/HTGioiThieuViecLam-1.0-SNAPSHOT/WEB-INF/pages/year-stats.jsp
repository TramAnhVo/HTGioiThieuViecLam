<%-- 
    Document   : year-stats
    Created on : Sep 10, 2023, 4:47:40 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/admin/yearStats" var="action" />
<h1 class="text-center text-success mt-3 mb-3">THỐNG KÊ BÁO CÁO CV THEO NGÀNH NGHỀ TRONG NĂM</h1>

<form action="${action}" class="d-flex searchStats container">
   <input type="number" class="form-control" placeholder="Nhập năm..." name="year" style="width: 80%; height: 60px">
    <button type="submit" class="btn btn-primary" style="margin-left: 1%">Lọc dữ liệu</button>
</form>

<div class="row" style="margin: 4% 5%">
    <div class="col-md-5 col-xs-12">
        <table class="table table-hover">
            <tr>
                <th>STT</th>
                <th>Ngành nghề</th>
                <th>Số lượng cv ứng tuyển</th>
            </tr>
            <c:forEach items="${revenues}" var="c">
                <tr>
                    <td>${c[0]}</td>
                    <td>${c[1]}</td>
                    <td>${c[2]}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-7 col-xs-12">
        <canvas id="myRevenueChart"></canvas>
    </div>
</div>
    
 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>    
    let data2 = [], label2 = [];
    <c:forEach items="${revenues}" var="c">
        label2.push('${c[1]}')
        data2.push(${c[2]});
    </c:forEach>
    
    window.onload = function() {
        drawChart(data2, label2, "số lượng cv ứng tuyển", "bar", "myRevenueChart");
    }
</script>    