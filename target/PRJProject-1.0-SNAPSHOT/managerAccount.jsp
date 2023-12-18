<%@page import="Models.Account"%>
<%-- 
    Document   : info
    Created on : Jun 23, 2023, 2:03:23 AM
    Author     : Admin
--%>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>    

        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
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
                if (ad.getIsSell() == 1 && ad.getIsAdmin() != 1) {
                    response.sendRedirect("/PRJProject/manager");
                }
            }
            Product p = (Product) session.getAttribute("InfoProduct");
        %>

        <div class="container mt-4">
            <div class="row">
                <div class="col-md-2"><jsp:include page="menuBar.jsp"/> </div>
                <div class="col-md-10">
                    <h1 class="text-center">Quản Lý Tài Khoản</h1>
                    <!--                    <a href="/PRJProject/manager">
                                            <button type="button" class="btn btn-primary bg-primary">Back</button>
                                        </a>-->
                    <a href="/PRJProject/manager/Account/NewAccount" class="btn btn-light " data-toggle="modal">
                        <i class='bx bx-message-square-add' ></i>
                        <span>Add New Account</span>
                    </a>
                    <table id="example">
                        <thead>
                            <tr>
                                <!--<th class="align-middle">NO</th>-->
                                <th class="align-middle">ID</th>
                                <th class="align-middle">Uername</th>
                                <th class="align-middle">Password</th>
                                <th class="align-middle">Fullname</th>
                                <th class="align-middle">Phone</th>
                                <th class="align-middle">Email</th>
                                <th class="align-middle">Sell</th>
                                <th class="align-middle">Admin</th>
                                <th class="align-middle">Status</th>
                                <th class="align-middle">option</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listAc}" var="o" varStatus="status">
                                <tr >
                                    <td class="align-middle">${o.account_id}</td>
                                    <td class="align-middle">${o.username}</td>
                                    <td class="align-middle"><p class="border-0">${o.password}</p></td>
                                    <td class="align-middle"><p>${o.fullname}</p></td>
                                    <td class="align-middle"><p>${o.phone_number}</p></td>
                                    <td class="align-middle"><p class="border-0">${o.email}</p></td>
                                    <td class="align-middle"><p>${o.isSell}</p></td>
                                    <td class="align-middle"><p>${o.isAdmin}</p></td>
                                    <td class="align-middle"><p>${o.status == true ? "Đang hoạt động" : "Đã khóa"}</p></td>
                                    <td class="align-middle">
                                        <c:if test="${sessionScope.quantri.isAdmin  == 1}">
                                            <a href="/PRJProject/manager/Account/EditAccount/${o.account_id}" class="btn btn-light" data-toggle="modal">
                                                <i class='bx bx-message-square-edit'></i>
                                            </a>
                                            <a onclick="return confirm('Để tránh mất hoàn toàn dữ liệu khi xóa chúng tôi chỉ cập nhật trạng thái của tài khoản là đã khóa')" href="/PRJProject/manager/Account/DeleteAccount/${o.account_id}" class="btn btn-light" data-toggle="modal">
                                                <i class='bx bxs-message-square-x'></i>
                                            </a>
                                        </c:if>

                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>