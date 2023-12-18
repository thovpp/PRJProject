<%-- 
    Document   : dangnhap
    Created on : Jun 14, 2023, 12:06:25 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/PRJProject/css/styles.css" rel="stylesheet" />
        <script src="/PRJProject/js/code.jquery.com_jquery-3.7.0.min.js"></script>
        <script src="DataTables/DataTables-1.13.4/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            .card {
                margin-top: 4rem;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <link rel="stylesheet" href="DataTables/DataTables-1.13.4/css/jquery.dataTables.min.css">
        <title>LOGIN</title>
        <script>
            $(document).ready(function () {
                $("form").submit(function (event) {
                    // Xóa thông báo lỗi trước đó
                    $(".error").remove();
                    // Thực hiện kiểm tra dữ liệu
                    var name = $("#username").val().trim();
                    var password = $("#password").val().trim();
                    var isValid = true;
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
                        $("#username").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    } else {
                        if ((!validateUser(name))) {
                            $("#username").after("<div style='color: red;' class='error'>Chỉ chấp nhận ký tự chữ cái và số chứa ít nhất 3 ký tự và tối đa 20 ký tự,không bao gồm ký tự đặc biệt</div>");
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
                    if (!validateUser(name)) {
                        return;
                    }
                    // Nếu kiểm tra không hợp lệ, dừng lại và ngăn chặn submit form
                    if (!isValid || !validatePassword(password)) {
                        return;
                    }
                });
            });
        </script>
    </head>
    <body>

        <section class="vh-100 bg-image" style="background-image: url('/PRJProject/img/background.png'); background-size: cover; background-position: center; background-repeat: no-repeat;">

            <div class="">
                <div class="container h-100 py-3">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                            <div class="card bg-white bg-opacity-75 text-black transition-background" style="border-radius: 1rem; ">
                                <div class="card-body p-5 text-center">
                                    <div class="mb-md-2">
                                        <form action="login" method="post">
                                            <p class="text-danger ">${mess}</p>
                                            <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                            <p class="text-black-50 mb-5">Please enter your login and password!</p>
                                            <div class="form-outline form-white mb-4">
                                                <input type="text" id="username" class="form-control form-control-lg" name="user" />
                                                <label class="form-label" for="typeEmailX">UserName</label>
                                            </div>
                                            <div class="form-outline form-white mb-4">
                                                <input type="password" id="password" class="form-control form-control-lg" name="pass"/>
                                                <label class="form-label" for="typePasswordX">Password</label>
                                            </div>
                                            <input class="form-check-input" type="checkbox" name="chkRem" value="1"/>Remember me?
                                            <p class="small mb-5 pb-lg-2"><a class="text-black-50" href="forgotpass">Forgot password?</a></p>
                                            <button name="btnSubmit" value="Login" class="btn btn-outline-dark btn-lg px-5" type="submit">Login</button>
                                        </form>
                                    </div>
                                    <div>
                                        <p class="mb-0">Don't have an account? <a href="signup" class="text-body fw-bold">Sign Up</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>
</html>
