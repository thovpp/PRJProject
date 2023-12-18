<%-- 
    Document   : ChangePass
    Created on : Jul 4, 2023, 7:11:33 PM
    Author     : Admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/styles.css" rel="stylesheet" />
        <script src="/PRJProject/js/code.jquery.com_jquery-3.7.0.min.js"></script>
        <title>Change Password</title>
        <script>
            $(document).ready(function () {
                $("form").submit(function (event) {
                    // Xóa thông báo lỗi trước đó
                    $(".error").remove();
                    // Thực hiện kiểm tra dữ liệu
                    var password = $("#newpass").val().trim();
                    var cur_pass = $("#expass").val().trim();
                    var renew_pass = $("#re_newpass").val().trim();
                    var isValid = true;
                    function validatePassword(password) {
                        var regex = /^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;
                        if (password.match(regex)) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (cur_pass === "") {
                        isValid = false;
                        $("#expass").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }
                    if (renew_pass === "") {
                        isValid = false;
                        $("#re_newpass").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    }
                    if (password === "") {
                        isValid = false;
                        $("#newpass").after("<div style='color: red;' class='error'>Vui lòng điền đầy đủ thông tin.</div>");
                        event.preventDefault();
                    } else {
                        if ((!validatePassword(password))) {
                            $("#newpass").after("<div style='color: red;' class='error'>Mật khẩu phải chứa ít nhất 8 kí tự và 1 kí tự đặc biệt</div>");
                            event.preventDefault();
                        }
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
        <section class="vh-100 vw-100 bg-image" style="background-image: url('/PRJProject/img/background.png'); background-size: cover; background-position: center; background-repeat: no-repeat; position: fixed;">
            <div class="mask d-flex align-items-center h-75 gradient-custom-3">

                <div class="container">
                    <div class="row d-flex justify-content-center align-items-center">
                        <div class="col-md-6">
                            <div class="card rounded-3">
                                <div class="card-body p-4">
                                    <c:if test="${messCP != null}">
                                        <p class="text-bg-success text-center">${messCP}</p>
                                        <div class="d-grid">
                                            <button  name="btnSubmit" value="changePass" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"><a class="text-decoration-none text-dark" href="login">Login</a></button>
                                        </div>
                                    </c:if>
                                    <c:if test="${messCP == null}">
                                        <h2 class="text-center mb-4">Change Password</h2>
                                        <p class="text-bg-danger text-center">${messCPF}</p>
                                        <form action="changepass" method="post">
                                            <div class="mb-3">
                                                <label for="password" class="form-label">Current Password</label>
                                                <input type="password"  id="expass" class="form-control" name="expass"/>
                                            </div>

                                            <div class="mb-3">
                                                <label for="confirm-password" class="form-label">New Password</label>
                                                <input type="password"  id="newpass" class="form-control" name="newpass" />
                                            </div>

                                            <div class="mb-3">
                                                <label for="confirm-password" class="form-label">Confirm New Password</label>
                                                <input type="password"  id="re_newpass" class="form-control"name="re_newpass" />
                                            </div>

                                            <div class="d-grid">
                                                <button type="submit" name="btnSubmit" value="changePass" class="btn btn-outline-dark btn-lg px-5">Change Password</button>                                            </div>
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
