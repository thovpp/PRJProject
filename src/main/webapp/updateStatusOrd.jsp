<%-- 
    Document   : editAccountByAD
    Created on : Jul 16, 2023, 1:08:02 PM
    Author     : Admin
--%>


<%@page import="Models.Customer"%>
<%@page import="DAOs.customerDAO"%>
<%@page import="Models.Product"%>
<%@page import="DAOs.productDAO"%>
<%@page import="DAOs.accountDAO"%>
<%@page import="Models.OrderDeltail"%>
<%@page import="Models.Order"%>
<%@page import="java.util.List"%>
<%@page import="Models.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/PRJProject/css/styles.css" rel="stylesheet" />
        <title>SIGN UP</title>
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
            List<Order> or = (List<Order>) session.getAttribute("IDOrd");
            List<OrderDeltail> orDetail = (List<OrderDeltail>) session.getAttribute("Otail");
            productDAO pdao = new productDAO();
            accountDAO acDAO = new accountDAO();
            Account ac = acDAO.getAccountByAcID(or.get(0).getAccount_id());
            customerDAO cusDAO = new customerDAO();
            Customer cus = cusDAO.getcustomerByPID(or.get(0).getCustomer_id());
        %>


        <section class="vh-75 bg-image" style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
            <div class="mask d-flex align-items-center h-75 gradient-custom-3">
                <div class="container">
                    <div class="row d-flex justify-content-center align-items-center">
                        <div class="col-md-6">
                            <%@include file="menuBar.jsp" %>
                            <div class="card rounded-3">
                                <div class="card-body p-4">
                                    <h2 class="text-center mb-4">Edit Status Order</h2>

                                    <form action="/PRJProject/manager" method="post">

                                        <div class="mb-3">
                                            <label for="pro_name">Ten Khach Hang: </label>
                                            <input type="text" required class="form-control" value="<%= cus.getCustomer_name()%>" name="pro_name" id="pro_name" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="pro_name">Dia Chi: </label>
                                            <input type="text" required class="form-control" value="<%= cus.getAddress()%>" name="pro_name" id="pro_name" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="pro_name">Email: </label>
                                            <input type="text" required class="form-control" value="<%= cus.getEmail()%>" name="pro_name" id="pro_name" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="pro_name">Phone Number: </label>
                                            <input type="text" required class="form-control" value="<%= cus.getPhone_number()%>" name="pro_name" id="pro_name" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="pro_name">Ten Tai Khoan: </label>
                                            <input readonly type="text" required class="form-control" value="<%= ac.getFullname() %>" name="pro_name" id="pro_name" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="pro_name">Status: </label>
                                            <select name="category" class="form-select" aria-label="Default select example">
                                                <option <%= or.get(0).getOrder_status().equals("Chờ xác nhận") ? "selected" : ""%> value="Chờ xác nhận">Chờ xác nhận</option>
                                                <option <%= or.get(0).getOrder_status().equals("Chờ vận chuyển") ? "selected" : ""%> value="Chờ vận chuyển">Chờ vận chuyển</option>
                                                <option <%= or.get(0).getOrder_status().equals("Đang vận chuyển") ? "selected" : ""%> value="Đang vận chuyển">Đang vận chuyển</option>
                                                <option <%= or.get(0).getOrder_status().equals("Ðã giao hàng") ? "selected" : ""%> value="Ðã giao hàng">Ðã giao hàng</option>
                                                <option <%= or.get(0).getOrder_status().equals("Đã hủy") ? "selected" : ""%> value="Đã hủy">Đã hủy</option>

                                            </select>
                                        </div>
                                        <input
                                            type="submit"
                                            value="Update Status"
                                            name="btnSubmit"
                                            class="btn-primary btn w-100 mx-auto"
                                            />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>

