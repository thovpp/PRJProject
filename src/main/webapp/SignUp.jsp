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
        <link href="css/styles.css" rel="stylesheet" />
        <script src="/PRJProject/js/code.jquery.com_jquery-3.7.0.min.js"></script>
        <title>SIGN UP</title>
        <style>
            /* Đảm bảo không có margin hoặc padding được áp dụng lên body và html */
            body, html {
                height: 100%;
                margin: 0;
                padding: 0;
            }

            /* Đảm bảo phần nền chiếm toàn bộ màn hình */
            .bg-image {
                background-image: url('/PRJProject/img/background.png');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                height: 100%;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
            }
            .content {
                max-height: 100%;
                overflow: auto;
            }

            .card {
                margin-top: 2.5rem;
            }
        </style>
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
                    } else {
                        if ((!validateUser(name))) {
                            $("#name").after("<div style='color: red;' class='error'>Chỉ chấp nhận ký tự chữ cái và số chứa ít nhất 3 ký tự và tối đa 20 ký tự,không bao gồm ký tự đặc biệt</div>");
                            event.preventDefault();
                        }
                    }
                    if (password === "") {
                        isValid = false;
                        $("#password").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    } else {
                        if ((!validatePassword(password))) {
                            $("#password").after("<div style='color: red;' class='error'>Mật khẩu phải chứa ít nhất 8 kí tự và 1 kí tự đặc biệt</div>");
                            event.preventDefault();
                        }
                    }
                    if (confirmpassword === "") {
                        isValid = false;
                        $("#confirm-password").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    } else if (confirmpassword !== password) {
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
        <section class="vh-100 bg-image" style="background-image: url('/PRJProject/img/background.png'); background-size: cover; background-position: center; background-repeat: no-repeat; position:fixed;">
            <div class="content">
                <div class="container py-4">
                    <div class="row d-flex justify-content-center align-items-center">
                        <div class="col-md-6">
                            <div class="card rounded-3 bg-white bg-opacity-75">
                                <div class="card-body p-4">
                                    <c:if test="${messAdd != null}">
                                        <p class="text-bg-success text-center">${messAdd}</p>
                                        <div class="d-grid">
                                            <button  name="btnSubmit" value="changePass" class="btn btn-outline-dark btn-lg px-5"><a class="text-decoration-none text-black" href="login">Login</a></button>
                                        </div>
                                    </c:if>

                                    <c:if test="${messCPF != null}">
                                        <p class="text-bg-danger text-center">${messCPF}</p>
                                        <div class="d-grid">
                                            <button  name="btnSubmit" value="changePass" class="btn btn-outline-dark btn-lg px-5"><a class="text-decoration-none text-black" href="/PRJProject/signup">Re-Register</a></button>
                                        </div>
                                    </c:if>

                                    <c:if test="${messAdd == null && messCPF == null}">
                                        <h2 class="text-center mb-4">CREATE AN ACCOUNT</h2>

                                        <form action="signup" method="post">
                                            <div class="mb-3">
                                                <label for="name" class="form-label">User Name</label>
                                                <input type="text" id="name" class="form-control" name="user" />
                                            </div>
                                            <div class="mb-3">
                                                <label for="email" class="form-label">Your Email</label>
                                                <input type="email" id="email" class="form-control" name="email"/>
                                            </div>
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Full Name</label>
                                                <input type="text" id="fullname" class="form-control" name="fullname"/>
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col">
                                                    <label for="password" class="form-label">Password</label>
                                                    <input type="password" id="password" class="form-control" name="pass" />
                                                </div>
                                                <div class="col">
                                                    <label for="confirm-password" class="form-label">Confirm Password</label>
                                                    <input type="password" id="confirm-password" class="form-control" name="re_pass" />
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Phone Number</label>
                                                <input type="number" id="phone" class="form-control" name="phone"/>
                                            </div>



                                            <div class="form-check mb-3">
                                                <input class="form-check-input" required type="checkbox" value="" id="terms" />
                                                <label class="form-check-label" for="terms">
                                                    I agree to the <a href="#!" class="text-body"><u>Terms of Service</u></a>
                                                </label>
                                            </div>

                                            <div class="d-grid">
                                                <button type="submit" class="btn btn-outline-dark btn-lg px-5">Register</button>
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
