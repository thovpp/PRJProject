<%-- 
    Document   : SIgnUp
    Created on : Jun 14, 2023, 7:57:32 AM
    Author     : admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/PRJProject/css/styles.css" rel="stylesheet" />
        <script src="/PRJProject/js/code.jquery.com_jquery-3.7.0.min.js"></script>
        <title>SIGN UP</title>
      <script>
            $(document).ready(function () {
                $("form").submit(function (event) {
                    // Xóa thông báo lỗi trước đó
                    $(".error").remove();

                    // Thực hiện kiểm tra dữ liệu
                    var name = $("#name").val().trim();
                    var password = $("#password").val().trim();
                    var confirmpassword = $("#confirm-password").val().trim();
                    var email = $("#email").val().trim();
                    var phone = $("#phone").val().trim();
                    var fullname = $("#fullname").val().trim();
                    var isValid = true;
                    
                    function validatePhoneNumber(phone) {
                        var phoneRegex = /^\d{10}$/;
                        if (phone.match(phoneRegex)) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    function validatePassword(password) {
                        var regex = /^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;
                        if (password.match(regex)) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    function validateUser(name) {
                        var usernameRegex = /^[a-zA-Z0-9]{3,20}$/;
                        if (name.match(usernameRegex)) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (name === "") {
                        isValid = false;
                        $("#name").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }else {
                        if ((!validateUser(name))) {
                            $("#name").after("<div style='color: red;' class='error'>Chỉ chấp nhận ký tự chữ cái và số chứa ít nhất 3 ký tự và tối đa 20 ký tự,không bao gồm ký tự đặc biệt</div>");
                            event.preventDefault();
                        }
                    }
                    if (password === "") {
                        isValid = false;
                        $("#password").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }else {
                        if ((!validatePassword(password))) {
                            $("#password").after("<div style='color: red;' class='error'>Mật khẩu phải chứa ít nhất 8 kí tự và 1 kí tự đặc biệt</div>");
                            event.preventDefault();
                        }
                    }
                    if (confirmpassword === "") {
                        isValid = false;
                        $("#confirm-password").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }else if (confirmpassword !== password) {
                        isValid = false;
                        $("#confirm-password").after("<div style='color: red;' class='error'>Nhập lại mật khẩu không đúng.</div>");
                        event.preventDefault();
                    }
                    if (email === "") {
                        isValid = false;
                        $("#email").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }
                    if (phone === "") {
                        isValid = false;
                        $("#phone").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }else {
                        if (!validatePhoneNumber(phone)) {
                            $("#phone").after("<div style='color: red;' class='error'>Số điện thoại phải có đúng 10 số.</div>");
                            event.preventDefault();
                        }
                    }
                    if (fullname === "") {
                        isValid = false;
                        $("#fullname").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }
                    // Nếu kiểm tra không hợp lệ, dừng lại và ngăn chặn submit form
                    if (!isValid || !validatePassword(password) || !validateUser(name)) {
                        return;
                    }
                });
            });
        </script>

    </head>
    <body>
        <section class="vh-75 bg-image" style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
            <div class="mask d-flex align-items-center h-75 gradient-custom-3">
                <div class="container">
                    <div class="row d-flex justify-content-center align-items-center">
                        <div class="col-md-6">
                            <%@include file="menuBar.jsp" %>
                            <div class="card rounded-3">
                                <div class="card-body p-4">
                                    <c:if test="${messAdd != null}">
                                        <p class="text-bg-success text-center">${messAdd}</p>
                                        <div class="d-grid">
                                            <button  name="btnSubmit" value="changePass" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"><a class="text-decoration-none text-dark" href="/PRJProject/manager/Account">Quản Lý Tài Khoản</a></button>
                                        </div>
                                    </c:if>

                                    <c:if test="${messCPF != null}">
                                        <p class="text-bg-danger text-center">${messCPF}</p>
                                        <div class="d-grid">
                                            <button  name="btnSubmit" value="changePass" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"><a class="text-decoration-none text-dark" href="/PRJProject/manager/Account/NewAccount">Đăng ký lại</a></button>
                                        </div>
                                    </c:if>

                                    <c:if test="${messAdd == null && messCPF == null}">
                                        <h2 class="text-center mb-4">Create an account</h2>

                                        <form action="/PRJProject/manager" method="post">
                                            <div class="mb-3">
                                                <label for="name" class="form-label">User Name</label>
                                                <input  type="text" id="name" class="form-control" name="user" />
                                            </div>

                                            <div class="mb-3">
                                                <label for="password" class="form-label">Password</label>
                                                <input  type="password" id="password" class="form-control" name="pass"/>
                                            </div>

                                            <div class="mb-3">
                                                <label for="confirm-password" class="form-label">Confirm Password</label>
                                                <input  type="password" id="confirm-password" class="form-control" name="re_pass"/>
                                            </div>

                                            <div class="mb-3">
                                                <label for="email" class="form-label">Your Email</label>
                                                <input  type="email" id="email" class="form-control" name="email"/>
                                            </div>

                                            <div class="mb-3">
                                                <label for="name" class="form-label">Seller</label>
                                                <input  type="radio" id="isSell" class="form-check-inline"  value="0" name="check" />
                                                <label for="name" class="form-label">Admin</label>
                                                <input  type="radio" id="isAdmin" class="form-check-inline" checked value="1" name="check" />
                                            </div>

                                            <div class="mb-3">
                                                <label for="name" class="form-label">Phone Number</label>
                                                <input  type="number" id="phone" class="form-control" name="phone"/>
                                            </div>

                                            <div class="mb-3">
                                                <label for="name" class="form-label">Full Name</label>
                                                <input  type="text" id="fullname" class="form-control" name="fullname"/>
                                            </div>

                                            <div class="d-grid">
                                                <button type="submit" value="addAdmin" name="btnSubmit"  class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                                            </div>

                                            <p class="text-center mt-3 mb-0">Already have an account? <a href="/PRJProject/login" class="text-body fw-bold"><u>Login here</u></a></p>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
