<%-- 
    Document   : info
    Created on : Jun 23, 2023, 2:03:23 AM
    Author     : Admin
--%>
<%@page import="Models.Account"%>
<%@page import="Models.Customer"%>
<%@page import="DAOs.customerDAO"%>
<%@page import="java.util.List"%>
<%@page import="Models.Order"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.Product"%>
<%@page import="DAOs.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
        <style>
            body {
                color: black;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
                background-color: #ffffff   ;
            }

            .main-title{
                margin: 0;
                padding: 0;
                border: none;
                outline: none;
                box-sizing: border-box;
            }

            #logo_img img{
                width: 5px;
                height: 5px;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                margin: 30px 0;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                position: fixed;
                padding-bottom: 15px;
                background: #000;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;

            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }
            img{
                width: 90px;
                height: 90px;
            }
            /* Thẻ canvas chứa biểu đồ */
            #myChart {
                width: 1800px;
                
                max-width: 1800px; /* Điều chỉnh chiều rộng tối đa */
                margin: 20px auto; /* Canh giữa biểu đồ và tạo khoảng cách với các phần khác */
                border-radius: 8px; /* Bo tròn viền của biểu đồ */
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Đổ bóng để tạo hiệu ứng nổi bật */
            }
            #myDoughnutChart {
                width: 1800px;
                
                max-width: 1800px; /* Điều chỉnh chiều rộng tối đa */
                margin: 20px auto; /* Canh giữa biểu đồ và tạo khoảng cách với các phần khác */
                border-radius: 8px; /* Bo tròn viền của biểu đồ */
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Đổ bóng để tạo hiệu ứng nổi bật */
            }

            /* Chỉnh màu và font chữ cho tiêu đề biểu đồ */
            .chart-title {
                color: #333; /* Màu chữ cho tiêu đề */
                font-size: 24px; /* Kích thước chữ tiêu đề */
                font-weight: bold; /* Đậm chữ cho tiêu đề */
                text-align: center; /* Căn giữa tiêu đề */
                margin-bottom: 20px; /* Tạo khoảng cách giữa tiêu đề và biểu đồ */
            }

            /* Chỉnh màu cho vùng nền nền và viền của biểu đồ */
            .chartjs-background {
                background-color: #f5f5f5; /* Màu nền của biểu đồ */
                border-radius: 8px; /* Bo tròn viền nền của biểu đồ */
            }

            /* Chỉnh màu cho các chữ, chỉ số trên trục x và y */
            .chartjs-axis-text {
                color: #555; /* Màu chữ trên trục */
                font-size: 12px; /* Kích thước chữ trục */
            }

            /* Chỉnh màu và font chữ cho nhãn trục y */
            .chartjs-axis-label {
                color: #333; /* Màu chữ nhãn trục y */
                font-size: 14px; /* Kích thước chữ nhãn trục y */
            }
            /* CSS cho bảng */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th, td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            /* Tạo màu nền xen kẽ cho các hàng */
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            /* CSS cho cột "Top" */
            .top-column {
                width: 80px; /* Điều chỉnh chiều rộng cột Top */
                font-weight: bold;
            }

            /* CSS cho cột "Số lần" và "Tổng đơn hàng" */
            .number-column {
                width: 120px; /* Điều chỉnh chiều rộng cột số */
                text-align: center;
            }

            /* CSS cho cột "Họ và tên" và "ID tài khoản" */
            .text-column {
                width: 200px; /* Điều chỉnh chiều rộng cột text */
            }
            



        </style>
    </head>
    <body>

        <%
            if (session.getAttribute("quantri") == null) {
                Cookie[] cookies = request.getCookies();
                boolean foundCookie = false;
                if (cookies != null) {
                    for (Cookie c : cookies) {
                        if (c.getName().equals("quantri")) {
                            foundCookie = true;
                            break;
                        }
                    }
                }
                if (!foundCookie && session.getAttribute("quantri") == null) {
                    response.sendRedirect("/PRJProject/home");
                }
            }
            
            if (session.getAttribute("quantri") != null) {
                Account ad = (Account) session.getAttribute("quantri");
                if (ad.getIsSell() != 1 && ad.getIsAdmin() != 1) {
                    response.sendRedirect("/PRJProject/home");
                }
            }
            List<Order> o = (List<Order>) session.getAttribute("monthRevenue");
        %>
        <div class="content">
            <div class="container mt-4">
                <div class="row">
                    <div class="col-md-1"><%@include file="menuBar.jsp" %></div>
                    <div class="col-md-11">
                        <h1 style="text-align: center;">Doanh Thu Theo Thang</h1>
                        <table class="table-bordered " id="example">
                            <thead>
                                <tr>
                                    <th class="align-middle">Thang</th>
                                    <th class="align-middle">Tổng Doanh Thu</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listRevenue}" var="o">
                                    <tr >
                                        <th class="align-middle">${o.monthRevenue}</th>
                                        <th class="align-middle">${o.totalRevenue}</th>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-md-6">
                                <canvas id="myChart" style="max-width: 100%; margin: 20px auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);"></canvas>
                                <p>Sơ đồ line doanh thu theo tháng</p>
                                <%
                                    customerDAO custdao = new customerDAO();
                                    List<Customer> listTop5cus = custdao.getTop5Customer();
                                    request.setAttribute("listTop5", listTop5cus);
                                %>
                                <c:forEach items="${listTop5}" var="o" varStatus="status">
                                    <table>
                                        <tr>
                                            <td class="top-column">Top ${status.index + 1}</td>
                                            <td class="text-column">${o.fullname}</td>
                                            <td class="text-column">${o.account_id}</td>
                                            <td class="number-column">${o.solan}</td>
                                            <td class="number-column">${o.order_total}</td>
                                        </tr>
                                    </table>
                                </c:forEach>

                            </div>
                            <div class="col-md-6">
                                 <p>Sơ đồ doungnut doanh thu theo tháng</p>
                                <canvas id="myDoughnutChart" style="max-width: 100%; margin: 20px auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);"></canvas>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
            // Khai báo mảng để lưu trữ dữ liệu từ thẻ HTML
            var labels = [];
            var data = [];

            // Lặp qua các thẻ HTML để lấy dữ liệu
            var tableRows = document.querySelectorAll("#example tbody tr");
            tableRows.forEach(function (row) {
                var month = row.cells[0].innerText; // Lấy tháng từ cột đầu tiên
                var revenue = parseFloat(row.cells[1].innerText); // Lấy doanh thu từ cột thứ hai

                labels.push(month); // Thêm tháng vào mảng nhãn
                data.push(revenue); // Thêm doanh thu vào mảng dữ liệu
            });

            // Vẽ biểu đồ bằng Chart.js
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                            label: 'Doanh thu theo tháng',
                            data: data,
                            backgroundColor: 'rgba(75, 192, 192, 0.2)', // Màu nền dưới đường
                            borderColor: 'rgba(75, 192, 192, 1)', // Màu viền đường
                            borderWidth: 1,
                            fill: true, // Điền màu dưới đường
                            cubicInterpolationMode: 'monotone' // Đường cong mượt
                        }]
                },
                options: {
                    scales: {
                        y: {
                            stacked: true // Xếp chồng dữ liệu trên trục y
                        }
                    }
                }
            });

    </script>
    <script>
        // Khai báo mảng để lưu trữ dữ liệu từ thẻ HTML
        var labels = [];
        var data = [];

        // Lặp qua các thẻ HTML để lấy dữ liệu
        var tableRows = document.querySelectorAll("#example tbody tr");
        tableRows.forEach(function (row) {
            var month = row.cells[0].innerText; // Lấy tháng từ cột đầu tiên
            var revenue = parseFloat(row.cells[1].innerText); // Lấy doanh thu từ cột thứ hai

            labels.push("Tháng " + month); // Thêm tháng vào mảng nhãn
            data.push(revenue); // Thêm doanh thu vào mảng dữ liệu
        });

        // Vẽ biểu đồ bằng Chart.js kiểu Doughnut
        var ctxDoughnut = document.getElementById('myDoughnutChart').getContext('2d');
        var myDoughnutChart = new Chart(ctxDoughnut, {
            type: 'doughnut',
            data: {
                labels: labels,
                datasets: [{
                        label: 'Doanh thu theo tháng',
                        data:  data,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.6)',
                            'rgba(54, 162, 235, 0.6)',
                            'rgba(255, 206, 86, 0.6)',
                            'rgba(75, 192, 192, 0.6)',
                            'rgba(153, 102, 255, 0.6)',
                            'rgba(255, 159, 64, 0.6)',
                            'rgba(255, 99, 132, 0.6)'
                                    // Bạn có thể thêm hoặc thay đổi màu sắc tùy ý
                        ],
                        borderWidth: 1
                    }]
            },
            options: {
                cutout: '20%', // Điều chỉnh độ rỗng giữa bánh
                plugins: {
                    legend: {
                        position: 'right' // Vị trí của chú thích
                    }
                }
            }
        });

    </script>
    



</html>

