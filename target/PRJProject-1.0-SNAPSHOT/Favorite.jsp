<%-- 
    Document   : Favorite
    Created on : Oct 24, 2023, 7:11:27 AM
    Author     : QuocLe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            .row {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
                justify-content: center;
            }

            .card {
                background-color: #fff;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
                position: relative;
                transition: transform 0.3s ease;
            }

            .card:hover {
                transform: translateY(-5px);
            }

            .card img {
                max-width: 100%;
                height: auto;
                display: block;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }

            .card-body {
                padding: 20px;
            }

            .text-center {
                text-align: center;
            }

            .text-dark {
                color: #333;
            }

            .text-muted {
                color: #777;
            }

            .delete-button {
                background-color: #f44336;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
                transition: background-color 0.3s;
            }

            .delete-button:hover {
                background-color: #d32f2f;
            }

            /* Badge Style */
            .badge {
                position: absolute;
                top: 10px;
                right: 10px;
                background-color: #333;
                color: #fff;
                padding: 5px;
                border-radius: 3px;
                font-size: 0.8em;
            }

        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach items="${listF}" var="o">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute">Sale</div>
                        <!-- Product image-->
                        <a href="<%=request.getContextPath()%>/details/${o.product_id}"><img class="card-img-top" src="${o.product_pic}" alt="...">
                        </a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">
                                    <a class="text-decoration-none text-dark" href="<%=request.getContextPath()%>/details/${o.product_id}">
                                        ${o.product_name}
                                    </a>
                                </h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">$80.00</span>
                                $${o.price}
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <a class="delete-button" href="<%=request.getContextPath()%>/deleteF?id=${o.product_id}&accid=${sessionScope.quantri.account_id}">Delete</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>
</html>