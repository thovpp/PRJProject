<%-- 
    Document   : SIgnUp
    Created on : Jun 14, 2023, 7:57:32 AM
    Author     : admin
--%>


<%@page import="Models.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/PRJProject/css/styles.css" rel="stylesheet" />
        <title>Edit Account</title>
        
    </head>
    <body>
        <%
            Account ac = (Account) session.getAttribute("quantri");
        %>
        <section class="vh-100 bg-image" style="background-image: url('/PRJProject/img/background.png'); background-size: cover; background-position: center; background-repeat: no-repeat;">
            <div>
                <div class="container py-5">
                    <div class="row d-flex justify-content-center align-items-center">
                        <div class="col-md-6">
                            <div class="card rounded-3" style="background: rgba(255, 255, 255, 0.7);">
                                <div class="card-body p-4">
                                    <c:if test="${messAdd != null}">
                                        <p class="text-bg-success text-center">${messAdd}</p>
                                        <div class="d-grid">
                                            <button  name="btnSubmit" value="changePass" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body"><a class="text-decoration-none text-dark" href="login">Login</a></button>
                                        </div>
                                    </c:if>
                                    <c:if test="${messAdd == null}">
                                        <h2 class="text-center mb-4">Edit Information</h2>

                                        <form action="/PRJProject/infoAccount" method="post">

                                            <div class="mb-3">
                                                <label for="password" class="form-label">Full Name:</label>
                                                <input type="text" required value="<%= ac.getFullname()%>" id="fullname" class="form-control" name="fullname"/>
                                            </div>

                                            <div class="mb-3">
                                                <label for="email" class="form-label">Your Email:</label>
                                                <input type="email" required value="<%= ac.getEmail()%>" id="email" class="form-control" name="email"/>
                                            </div>

                                            <div class="mb-3">
                                                <label for="name" class="form-label">Phone Number:</label>
                                                <input type="tel" required value="<%= ac.getPhone_number()%>" id="phone" class="form-control" name="phone"/>
                                            </div>
                                            <div class="d-flex justify-content-center">
                                                <input
                                                    type="submit"
                                                    value="Update"
                                                    name="btnSubmit"
                                                    class="btn btn-outline-dark btn-lg px-5" style="margin-right: 1rem;" />
                                                <a href="/PRJProject/infoAccount">
                                                    <button class="btn btn-outline-dark btn-lg px-5" type="button" class="btn btn-primary bg-primary">Cancel</button>
                                                </a>
                                            </div>

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
