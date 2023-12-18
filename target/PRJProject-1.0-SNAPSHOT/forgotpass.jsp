<%-- 
    Document   : forgotpass
    Created on : Jul 4, 2023, 2:08:54 PM
    Author     : Admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/styles.css" rel="stylesheet" />
        <title>SIGN UP</title>
    </head>
    <body>
        <section class="vh-100 vw-100 bg-image" style="background-image: url('/PRJProject/img/background.png'); background-size: cover; background-position: center; background-repeat: no-repeat; position:fixed;">
            <div class="">
                <div class="container py-5">
                    <div class="d-flex justify-content-center">
                        <div class="col-md-6">
                            <c:if test="${mess != null}">
                                <p class="text-bg-success text-center">${mess}</p>
                                <div class="d-grid">
                                    <button  name="btnSubmit" value="changePass" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"><a class="text-decoration-none text-dark" href="login">Login</a></button>
                                </div>
                            </c:if>
                            <div class="card rounded-3" style="background: rgba(255, 255, 255, 0.7);">
                                <c:if test="${mess == null}">
                                    <div class="card-body p-4">
                                        <h2 class="text-center mb-4">Forgot Password</h2>
                                        <form action="forgotpass" method="post">
                                            <div class="mb-3">
                                                <label for="name" class="form-label">User Name</label>
                                                <input type="text" id="name" class="form-control" name="user" required />
                                            </div>
                                            <div class="mb-3">
                                                <label for="email" class="form-label">Your Email</label>
                                                <input type="email" id="email" class="form-control" name="email" required />
                                            </div>
                                            <div class="d-grid">
                                                `           <button type="submit" class="btn btn-outline-dark btn-lg px-5">SEND</button>
                                            </div>
                                        </form>
                                    </div>
                                </c:if>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


    </body>
</html>
