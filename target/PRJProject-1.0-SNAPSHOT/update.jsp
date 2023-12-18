<%-- 
    Document   : update
    Created on : Jun 23, 2023, 1:00:55 AM
    Author     : Admin
--%>

<%@page import="Models.Account"%>
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
//                    if (pro_pic === "") {
//                        isValid = false;
//                        $("#pro_pic").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
//                        event.preventDefault();
//                    }
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
            Product p = (Product) session.getAttribute("IDProduct");
            Account ac = (Account) session.getAttribute("quantri");
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
                    <h2 class="text-center text-uppercase py-3">Update Product!</h2>
                    <div class="text-bg-dark text-center text-danger">${checkerr}</div>
                    <div class="mb-3">
                        <label for="pro_name">Ten San Pham: </label>
                        <input type="text" required class="form-control" value="<%= p.getProduct_name()%>" name="pro_name" id="pro_name" />
                    </div>
                    <div class="mb-3">
                        <label for="pro_pic">File hinh anh: </label>
                        <input  type="file" name="pro_pic" accept=".jpg, .png, .webp" class="form-control" id="pro_pic" />

                    </div>
                    <div class="text-bg-dark text-center text-danger">${mes}</div>
                    <div class="mb-3">
                        <label for="pro_quan">Color: </label>
                        <input type="text" name="pro_color" value="<%=p.getProduct_color()%>" class="form-control" id="pro_color" />
                    </div>
                    <div class="mb-3">
                        <label for="pro_price">Gia San Pham: </label>
                        <input type="number" name="pro_price" value="<%= p.getPrice()%>" class="form-control" id="pro_price" />
                    </div>
                    <div class="mb-3">
                        <label for="pro_quan">So Luong: </label>
                        <input type="number" required name="pro_quan" value="<%= p.getStock_quantity()%>" class="form-control" id="pro_quan" />
                    </div>
                    <div class="mb-3">
                        <label for="pro_des">Mo ta san pham: </label>
                        <input type="text" required name="pro_des" value="<%= p.getDes()%>" class="form-control" id="pro_des"/>
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <select name="category" class="form-select" aria-label="Default select example">
                            <c:forEach items="${listC}" var="o">
                                <option value="${o.category_id}">${o.category_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                        <c:if test="<%= ac.getIsAdmin() == 1 %>">
                            <div class="form-group">
                        <label>Status:</label>
                        <select name="pro_status" class="form-select" aria-label="Default select example">
                            <option <%= p.getProduct_status().equals("Đang hoạt động") ? "Selected" : ""%> value="Đang hoạt động">Đang hoạt động</option>
                            <option <%= p.getProduct_status().equals("Chờ duyệt") ? "Selected" : ""%> value="Chờ duyệt">Chờ duyệt</option>
                            <option <%= p.getProduct_status().equals("Ngừng bán") ? "Selected" : "" %> value="Ngừng bán">Ngừng bán</option>
                            <option  <%= p.getProduct_status().equals("Hết hàng") ? "Selected" : "" %> value="Hết hàng">Hết hàng</option>
                        </select>
                    </div>
                        </c:if>
                    
                     <c:if test="<%= ac.getIsAdmin() == 0 && ac.getIsSell() == 1 %>">
                            <div class="form-group">
                        <label>Status:</label>
                        <select name="pro_status" class="form-select" aria-label="Default select example">
                            <option  value="<%= p.getProduct_status()%>"><%= p.getProduct_status()%></option>
                        </select>
                    </div>
                        </c:if>
                    <input
                        type="submit"
                        value="Update"
                        name="btnSubmit"
                        class="btn-primary btn w-100 mx-auto"
                        />
                </form>
            </div>
        </div>
    </body>
</html>
