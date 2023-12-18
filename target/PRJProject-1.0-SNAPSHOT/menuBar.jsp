<%@page import="Models.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.Product"%>
<%@page import="DAOs.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!----======== CSS ======== -->
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <!----===== Boxicons CSS ===== -->
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

        <style>/* Google Font Import - Poppins */
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            :root{
                /* ===== Colors ===== */
                --body-color: #E4E9F7;
                --sidebar-color: #FFF;
                --primary-color: #695CFE;
                --primary-color-light: #F6F5FF;
                --toggle-color: #DDD;
                --text-color: #707070;

                /* ====== Transition ====== */
                --tran-03: all 0.2s ease;
                --tran-03: all 0.3s ease;
                --tran-04: all 0.3s ease;
                --tran-05: all 0.3s ease;
            }

            body{
                min-height: 100vh;
                background-color: var(--body-color);
                transition: var(--tran-05);
            }

            ::selection{
                background-color: var(--primary-color);
                color: #fff;
            }

            body.dark{
                --body-color: #18191a;
                --sidebar-color: #242526;
                --primary-color: #3a3b3c;
                --primary-color-light: #3a3b3c;
                --toggle-color: #fff;
                --text-color: #ccc;
            }

            /* ===== Sidebar ===== */
            .sidebar{
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                width: 300px;
                padding: 10px 14px;
                background: var(--sidebar-color);
                transition: var(--tran-05);
                z-index: 100;
            }
            .sidebar.close{
                width: 250px;
            }

            /* ===== Reusable code - Here ===== */
            .sidebar li{
                height: 50px;
                list-style: none;
                display: flex;
                align-items: center;
                margin-top: 10px;
            }

            .sidebar header .image,
            .sidebar .icon{
                min-width: 60px;
                border-radius: 6px;
            }

            .sidebar .icon{
                min-width: 60px;
                border-radius: 6px;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 20px;
            }

            .sidebar .text,
            .sidebar .icon{
                color: var(--text-color);
                transition: var(--tran-03);
            }

            .sidebar .text{
                font-size: 17px;
                font-weight: 500;
                white-space: nowrap;
                /*                   opacity: 1;*/
            }
            .sidebar.close .text{
                /*                    opacity: 0;*/
            }
            /* =========================== */

            .sidebar header{
                position: relative;
            }

            .sidebar header .image-text{
                display: flex;
                align-items: center;
            }
            .sidebar header .logo-text{
                display: flex;
                flex-direction: column;
            }
            header .image-text .name {
                margin-top: 2px;
                font-size: 18px;
                font-weight: 600;
            }

            header .image-text .profession{
                font-size: 16px;
                margin-top: -2px;
                display: block;
            }

            .sidebar header .image{
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .sidebar header .image img{
                width: 40px;
                border-radius: 6px;
            }

            .sidebar header .toggle{
                position: absolute;
                top: 50%;
                right: -25px;
                transform: translateY(-50%) rotate(180deg);
                height: 25px;
                width: 25px;
                background-color: var(--primary-color);
                color: var(--sidebar-color);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 22px;
                cursor: pointer;
                transition: var(--tran-05);
            }

            body.dark .sidebar header .toggle{
                color: var(--text-color);
            }

            .sidebar.close .toggle{
                transform: translateY(-50%) rotate(0deg);
            }

            .sidebar .menu{
                margin-top: 40px;
            }

            .sidebar li.search-box{
                border-radius: 6px;
                background-color: var(--primary-color-light);
                cursor: pointer;
                transition: var(--tran-05);
            }

            .sidebar li.search-box input{
                height: 100%;
                width: 100%;
                outline: none;
                border: none;
                background-color: var(--primary-color-light);
                color: var(--text-color);
                border-radius: 6px;
                font-size: 17px;
                font-weight: 500;
                transition: var(--tran-05);
            }
            .sidebar li a{
                list-style: none;
                height: 100%;
                background-color: transparent;
                display: flex;
                align-items: center;
                height: 100%;
                width: 100%;
                border-radius: 6px;
                text-decoration: none;
                transition: var(--tran-03);
            }

            .sidebar li a:hover{
                background-color: var(--primary-color);
            }
            .sidebar li a:hover .icon,
            .sidebar li a:hover .text{
                color: var(--sidebar-color);
            }
            body.dark .sidebar li a:hover .icon,
            body.dark .sidebar li a:hover .text{
                color: var(--text-color);
            }

            .sidebar .menu-bar{
                height: calc(100% - 55px);
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                overflow-y: scroll;
            }
            .menu-bar::-webkit-scrollbar{
                display: none;
            }
            .sidebar .menu-bar .mode{
                border-radius: 6px;
                background-color: var(--primary-color-light);
                position: relative;
                transition: var(--tran-05);
            }

            .menu-bar .mode .sun-moon{
                height: 50px;
                width: 60px;
            }

            .mode .sun-moon i{
                position: absolute;
            }
            .mode .sun-moon i.sun{
                /*                    opacity: 0;*/
            }
            body.dark .mode .sun-moon i.sun{
                opacity: 1;
            }
            body.dark .mode .sun-moon i.moon{
                opacity: 0;
            }

            .menu-bar .bottom-content .toggle-switch{
                position: absolute;
                right: 0;
                height: 100%;
                min-width: 60px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 6px;
                cursor: pointer;
            }
            .toggle-switch .switch{
                position: relative;
                height: 22px;
                width: 40px;
                border-radius: 25px;
                background-color: var(--toggle-color);
                transition: var(--tran-05);
            }

            .switch::before{
                content: '';
                position: absolute;
                height: 15px;
                width: 15px;
                border-radius: 50%;
                top: 50%;
                left: 5px;
                transform: translateY(-50%);
                background-color: var(--sidebar-color);
                transition: var(--tran-04);
            }

            body.dark .switch::before{
                left: 20px;
            }

            .home{
                position: absolute;
                top: 0;
                top: 0;
                left: 250px;
                height: 100vh;
                width: calc(100% - 250px);
                background-color: var(--body-color);
                transition: var(--tran-05);
            }
            .home .text{
                font-size: 30px;
                font-weight: 500;
                color: var(--text-color);
                padding: 12px 60px;
            }

            .sidebar.close ~ .home{
                left: 78px;
                height: 100vh;
                width: calc(100% - 78px);
            }
            body.dark .home .text{
                color: var(--text-color);
            }

            .content {
                margin-left: 300px;
                padding: 20px;
                transition: margin-left 0.3s ease;
            }


            .menu-bar + .content {
                margin-left: 300px;
            }

            .sidebar.close + .content {
                margin-left: 88px;
            }
            ol,
            ul {
                padding-left: 0;
            }
        </style>
        <!--<title>Dashboard Sidebar Menu</title>--> 
    </head>
    <body>
        <div class="menu-bar">
            <nav class="sidebar">
                <header>
                    <div class="image-text">


                        <div style="margin-left: 90px;" class="text logo-text">
                            <a href="/PRJProject/home"><img " src="/PRJProject/img/logo.png" style="max-width: 90px;" alt="alt"/> </a>
                            <span class="name">Dashboard</span>

                        </div>
                    </div>


                </header>
                <div style="border-top: solid 1px; margin-top: 25px; margin-bottom: -26px;"></div>

                <div class="menu-bar">
                    <div class="menu">



                        <ul class="menu-links">
                            <li class="nav-link">
                                <a href="/PRJProject/manager">
                                    <i class="fas fa-cubes icon"></i>
                                    <span class="text nav-text">Manager</span>
                                </a>
                            </li>

                            <li class="nav-link">
                                <a href="/PRJProject/manager/stopselling">
                                    <i class="far fa-times-circle icon"></i>
                                    <span class="text nav-text">Stop Selling</span>
                                </a>
                            </li>

                            <li class="nav-link">
                                <a href="/PRJProject/manager/ProductApproval">
                                    <i class="fas fa-stopwatch icon"></i>
                                    <span class="text nav-text">Products Approval</span>
                                </a>
                            </li>

                            <li class="nav-link">
                                <a href="/PRJProject/manager/outofstock">
                                    <i class="fas fa-exclamation-circle icon"></i>
                                    <span class="text nav-text">Out of Stocks</span>
                                </a>
                            </li>

                            <li class="nav-link">
                                <a href="/PRJProject/manager/top5Customer">
                                    <i class="fas fa-users icon"></i>
                                    <span class="text nav-text">Top 5 Customers</span>
                                </a>
                            </li>

                            <li class="nav-link">
                                <a href="/PRJProject/manager/ShowOrder">
                                    <i class="fas fa-window-restore icon"></i>
                                    <span class="text nav-text">Orders Management</span>
                                </a>
                            </li>
                            <c:if test="${sessionScope.quantri.isAdmin  == 1}">
                                <li class="nav-link">
                                    <a href="/PRJProject/manager/Account">
                                        <i class="fas fa-users-cog icon"></i>
                                        <span class="text nav-text">Account Management</span>
                                    </a>
                                </li><!-- comment -->
                            </c:if>
                            <c:if test="${sessionScope.quantri.isAdmin  == 1}">
                                <li class="nav-link">
                                    <a href="/PRJProject/manager/employee">
                                        <i class="fas fa-user-tie icon"></i>
                                        <span class="text nav-text">Employee Management</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.quantri.isAdmin  == 1}">
                                <li class="nav-link">
                                    <a href="/PRJProject/manager/monthRevenue">
                                        <i class="fas fa-chart-bar icon"></i>
                                        <span class="text nav-text">Month Revenue</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.quantri.isAdmin  == 1}">
                                <li class="nav-link">
                                    <a href="/PRJProject/manager/supplier">
                                        <i class="far fa-handshake icon"></i>
                                        <span class="text nav-text">Suppliers</span>
                                    </a>
                                </li>
                            </c:if>


                        </ul>
                    </div>


                </div>

            </nav>
        </div>



        <script>
            const body = document.querySelector('body'),
                    sidebar = body.querySelector('nav'),
                    toggle = body.querySelector(".toggle"),
                    searchBtn = body.querySelector(".search-box"),
                    modeSwitch = body.querySelector(".toggle-switch"),
                    modeText = body.querySelector(".mode-text");



            modeSwitch.addEventListener("click", () => {
                body.classList.toggle("dark");

                if (body.classList.contains("dark")) {
                    modeText.innerText = "Light mode";
                } else {
                    modeText.innerText = "Dark mode";

                }
            });
        </script>

    </body>
</html>
