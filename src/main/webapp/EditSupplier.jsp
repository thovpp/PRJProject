<%-- 
    Document   : update
    Created on : Jun 23, 2023, 1:00:55 AM
    Author     : Admin
--%>

<%@page import="Models.Account"%>
<%@page import="Models.Supplier"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.io.File"%>
<%@page import="Models.Product"%>
<%@page import="DAOs.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/PRJProject/css/bootstrap.min.css">
        <script src="/PRJProject/js/code.jquery.com_jquery-3.7.0.min.js"></script>

        <script>
            $(document).ready(function () {
                $("form").submit(function (event) {
                    // Xóa thông báo lỗi trước đó
                    $(".error").remove();

                    // Thực hiện kiểm tra dữ liệu
                    var pro_id = $("#pro_id").val().trim();
                    var pro_name = $("#pro_name").val().trim();
                    var pro_quan = $("#pro_quan").val().trim();
                    var pro_price = $("#pro_price").val().trim();
                    var pro_pic = $("#pro_pic").val().trim();
                    var pro_des = $("#pro_des").val().trim();
                    var isValid = true;

                    if (pro_id === "") {
                        isValid = false;
                        $("#pro_id").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }
                    if (pro_name === "") {
                        isValid = false;
                        $("#pro_name").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }
                    if (pro_quan === "") {
                        isValid = false;
                        $("#pro_quan").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }
                    if (pro_price === "") {
                        isValid = false;
                        $("#pro_price").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }
                    if (pro_pic === "") {
                        isValid = false;
                        $("#pro_pic").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }
                    if (pro_des === "") {
                        isValid = false;
                        $("#pro_des").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }
                    // Nếu kiểm tra không hợp lệ, dừng lại và ngăn chặn submit form
                    if (!isValid) {
                        return;
                    }
                });
            });
        </script>
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
            Supplier sup = (Supplier) session.getAttribute("Sup");
        %>

        <div class="container">
            <div class="row justify-content-around">
                <form
                    action="/PRJProject/manager"
                    class="col-md-6 rounded-4 bg-light p-3 my-3"
                    id="form"
                    method="post"
                    enctype="multipart/form-data"
                    >
                    <h2 class="text-center text-uppercase py-3">Update Supplier</h2>
                    <div class="mb-3">
                        <label for="sup_name">Ten: </label>
                        <input type="text" required class="form-control" value="<%= sup.getSupplier_Name()%>" name="sup_name" id="pro_name" />
                    </div>
                    <div class="mb-3">
                        <label for="pro_quan">Dia Chi: </label>
                        <input type="text" name="sup_address" value="<%= sup.getSupplier_Address()%>" class="form-control" id="pro_color" />
                    </div>
                    <div class="mb-3">
                        <label for="pro_price">Phone Number: </label>
                        <input type="number" name="sup_phone" value="<%= sup.getSupplier_phone()%>" class="form-control" id="pro_price" />
                    </div>
                    <div class="mb-3">
                        <label for="pro_quan">Email:  </label>
                        <input type="email" required name="sup_email" value="<%= sup.getSupplier_Email()%>" class="form-control" id="pro_quan" />
                    </div>
                    <div class="form-group">
                        <label>Status:</label>
                        <select name="sup_status" class="form-select" aria-label="Default select example">
                            <option <%=  sup.isSupplier_Status() == true ? "selected" : ""%> value="1">Đang hoạt động</option>
                            <option <%=  sup.isSupplier_Status() == false ? "selected" : ""%>  value="0">Ngừng cung cấp</option>
                        </select>
                    </div>
                    <input
                        type="submit"
                        value="UpdateSupplier"
                        name="btnSubmit"
                        class="btn-primary btn w-100 mx-auto"
                        />
                </form>
            </div>
        </div>
    </body>
</html>
