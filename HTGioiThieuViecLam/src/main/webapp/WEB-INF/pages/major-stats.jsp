<%-- 
    Document   : stats
    Created on : Aug 21, 2023, 11:16:53 PM
    Author     : TramAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/admin/majorStats" var="action" />
<h1 class="text-center text-success mt-3">THỐNG KÊ BÁO CÁO BÀI ĐĂNG CÔNG VIỆC THEO NGÀNH NGHỀ</h1>

    <!-- bieu do tron -->
<div class="row container mt-5">
    <div class="col-md-7">
        <table class="table table-hover">
            <tr>
                <th>STT</th>
                <th>Ngành nghề</th>
                <th>Số lượng công việc theo ngành nghề</th>
            </tr>
            <c:forEach items="${majorStats}" var="c">
                <tr>
                    <td>${c[0]}</td>
                    <td>${c[1]}</td>
                    <td>${c[2]}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-5">
         <canvas id="myCateChart"></canvas>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>
    let data1 = [], label1 = [];
    <c:forEach items="${majorStats}" var="c">
        label1.push('${c[1]}')
        data1.push(${c[2]});
    </c:forEach>
        
    window.onload = function() {
        drawChart(data1, label1, "Số lượng công việc");
    }
</script>