<%-- 
    Document   : header.jsp
    Created on : Jul 6, 2023, 9:08:40 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="/PRJProject/css/swiper-bundle.min.css">
        <!-- Core theme CSS (includes Bootstrap)-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="/PRJProject/js/swiper-bundle.min.js"></script>
        <link href="/PRJProject/css/styles.css" rel="stylesheet" />
    </head>

    <style>

        .mualai{
            background-color: orangered;
            color: white;
            border-color: #FFA500;
        }
        .mualai:hover{
            background-color: orangered;
            color: white;
            border-color: #F44336;
        }

        .search-bar{
            width: 250px;
            height: 45px;
            background: transparent;
            border: 2px solid #e4e4e4;
            border-radius: 6px;
            display: flex;
            align-items: center;
        }
        .search-bar input{
            width: 100%;
            background: transparent;
            border: none;
            outline: none;
            font-size: 16px;
            color: #e4e4e4;
            padding-left: 10px;
        }

        .search-bar input::placeholder{
            color: #e4e4e4;
        }
        .search-bar button {
            width: 40px;
            height: 100%;
            background: transparent;
            border: none;
            outline: none;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }

        .search-bar button i{
            font-size: 22px;
            color: #e4e4e4;
        }
        .section_gap {
            padding: 100px 0;
        }
        @media (max-width: 991px) {
            .section_gap {
                padding: 80px 0;
            }
        }

        .section_gap_top_75 {
            padding: 75px 0;
        }
        @media (max-width: 991px) {
            .section_gap_top_75 {
                padding: 70px 0;
            }
        }

        .section_gap_75 {
            padding: 75px 0;
        }
        @media (max-width: 991px) {
            .section_gap_75 {
                padding: 70px 0;
            }
        }

        .section_gap_top {
            padding-top: 100px;
        }
        @media (max-width: 991px) {
            .section_gap_top {
                padding-top: 80px;
            }
        }

        .section_gap_bottom {
            padding-bottom: 100px;
        }
        @media (max-width: 991px) {
            .section_gap_bottom {
                padding-bottom: 80px;
            }
        }
        @media (max-width: 768px) {
            .features-area {
                padding-top: 0;
            }
        }
        .features-area .col-lg-3:last-child .single-features {
            border-right: 0;
        }
        @media (max-width: 575px) {
            .features-area .col-lg-3:last-child .single-features {
                margin-top: 30px;
            }
        }
        .features-area .col-lg-3:nth-child(3) .single-features,
        .features-area .col-lg-3:nth-child(4) .single-features {
            margin-bottom: 0;
        }

        .features-inner {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px 0;
        }

        .single-features {
            text-align: center;
            border-right: 1px solid #eeeeee;
        }
        @media (max-width: 991px) {
            .single-features {
                border-right: none;
                margin-bottom: 30px;
            }
        }
        .single-features .f-icon {
            margin-bottom: 20px;
        }
        .single-features .f-icon img {
            -webkit-transition: all 0.3s ease 0s;
            -moz-transition: all 0.3s ease 0s;
            -o-transition: all 0.3s ease 0s;
            transition: all 0.3s ease 0s;
        }
        .single-features h6 {
            font-size: 16px;
            margin-bottom: 0;
        }
        .single-features p {
            margin-bottom: 0;
        }
        .single-features:hover .f-icon img {
            opacity: .5;
        }
        .gray-bg {
            background: #f9f9ff;
        }

        .single-deal {
            position: relative;
            margin-bottom: 30px;
        }
        .single-deal .overlay {
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 100%;
            content: "";
            background: #000;
            opacity: 0;
            visibility: hidden;
            -webkit-transition: all 0.3s ease 0s;
            -moz-transition: all 0.3s ease 0s;
            -o-transition: all 0.3s ease 0s;
            transition: all 0.3s ease 0s;
        }
        .single-deal .deal-details {
            position: absolute;
            left: 50%;
            top: 115%;
            display: inline-block;
            text-align: center;
            -webkit-transform: translate(-50%, -50%);
            -moz-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            -o-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            opacity: 0;
            visibility: hidden;
            -webkit-transition: all 0.3s ease 0s;
            -moz-transition: all 0.3s ease 0s;
            -o-transition: all 0.3s ease 0s;
            transition: all 0.3s ease 0s;
        }
        .single-deal .deal-details h6 {
            color: #fff;
            text-transform: uppercase;
        }
        .single-deal:hover .overlay {
            opacity: .5;
            visibility: visible;
        }
        .single-deal:hover .deal-details {
            top: 50%;
            opacity: 1;
            visibility: visible;
        }


        .single-product {
            margin-bottom: 50px;
        }
        .single-product img {
            margin-bottom: 20px;
            width: 100%;
        }
        .single-product .product-details h6 {
            font-size: 16px;
            text-transform: uppercase;
        }
        .single-product .product-details .price h6 {
            font-size: 14px;
            display: inline-block;
            padding-right: 15px;
            margin: 0;
        }
        .single-product .product-details .price .l-through {
            text-decoration: line-through;
            color: #cccccc;
            margin-bottom: 0;
        }
        .single-product .product-details .prd-bottom {
            position: relative;
            margin-top: 20px;
        }
        .single-product .product-details .prd-bottom .social-info {
            position: relative;
            display: inline-block;
            width: 35px;
            -webkit-transition: all 0.3s ease 0s;
            -moz-transition: all 0.3s ease 0s;
            -o-transition: all 0.3s ease 0s;
            transition: all 0.3s ease 0s;
            overflow: hidden;
        }
        .single-product .product-details .prd-bottom .social-info span {
            position: relative;
            height: 30px;
            width: 30px;
            line-height: 30px;
            text-align: center;
            background: #828bb2;
            border-radius: 50%;
            display: inline-block;
            color: #fff;
            -webkit-transition: all 0.3s ease 0s;
            -moz-transition: all 0.3s ease 0s;
            -o-transition: all 0.3s ease 0s;
            transition: all 0.3s ease 0s;
            z-index: 1;
        }
        .single-product .product-details .prd-bottom .social-info span:after {
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 100%;
            content: "";
            border-radius: 50%;
            opacity: 0;
            visibility: hidden;
            z-index: -1;
        }
        .single-product .product-details .prd-bottom .social-info .hover-text {
            position: absolute;
            left: 0;
            top: 3px;
            width: 100px;
            left: -40px;
            text-transform: uppercase;
            font-family: "Poppins", sans-serif;
            font-weight: 500;
            font-size: 12px;
            color: #222222;
            -webkit-transition: all 0.3s ease 0s;
            -moz-transition: all 0.3s ease 0s;
            -o-transition: all 0.3s ease 0s;
            transition: all 0.3s ease 0s;
            opacity: 0;
            visibility: hidden;
        }
        .single-product .product-details .prd-bottom .social-info:hover {
            width: 115px;
        }
        .single-product .product-details .prd-bottom .social-info:hover span:after {
            opacity: 1;
            visibility: visible;
        }
        .single-product .product-details .prd-bottom .social-info:hover .hover-text {
            opacity: 1;
            visibility: visible;
            left: 40px;
        }

        .active-product-area {
            padding-top: 70px;
            padding-bottom: 50px;
        }
        .active-product-area .owl-nav div {
            position: absolute;
            left: 35%;
            top: 7%;
            opacity: .3;
        }
        @media (max-width: 1440px) {
            .active-product-area .owl-nav div {
                left: 30%;
            }
        }
        @media (max-width: 1200px) {
            .active-product-area .owl-nav div {
                left: 28%;
            }
        }
        @media (max-width: 991px) {
            .active-product-area .owl-nav div {
                top: 3%;
                left: 25%;
            }
        }
        @media (max-width: 870px) {
            .active-product-area .owl-nav div {
                left: 15%;
            }
        }
        @media (max-width: 767px) {
            .active-product-area .owl-nav div {
                left: 10%;
                top: 2%;
                margin-top: -25px;
            }
        }
        @media (max-width: 570px) {
            .active-product-area .owl-nav div {
                left: 37%;
                top: 1%;
                margin-top: -25px;
            }
        }
        @media (max-width: 480px) {
            .active-product-area .owl-nav div {
                margin-top: -20px;
                left: 28%;
            }
        }
        .active-product-area .owl-nav div:hover {
            opacity: 1;
        }
        .active-product-area .owl-nav .owl-next {
            left: auto;
            right: 35%;
        }
        @media (max-width: 1440px) {
            .active-product-area .owl-nav .owl-next {
                right: 30%;
            }
        }
        @media (max-width: 1200px) {
            .active-product-area .owl-nav .owl-next {
                right: 28%;
            }
        }
        @media (max-width: 991px) {
            .active-product-area .owl-nav .owl-next {
                top: 3%;
                right: 25%;
            }
        }
        @media (max-width: 870px) {
            .active-product-area .owl-nav .owl-next {
                right: 15%;
            }
        }
        @media (max-width: 767px) {
            .active-product-area .owl-nav .owl-next {
                right: 10%;
                top: 2%;
                margin-top: -25px;
            }
        }
        @media (max-width: 570px) {
            .active-product-area .owl-nav .owl-next {
                right: 37%;
                top: 1%;
                margin-top: -25px;
            }
        }
        @media (max-width: 480px) {
            .active-product-area .owl-nav .owl-next {
                margin-top: -20px;
                right: 28%;
            }
        }

        .ti-bag:before {
            content: "\e655";
        }
        .ti-move:before {
            content: "\e656";
        }

        .color-content{
            /*            margin-top: 3.2rem;*/
            padding: 1rem 0;
            display: flex;
            justify-content: center; /* Để chia giữa */
        }
        .color-content h3{
            text-transform: uppercase;
            font-size: 1.6rem;
        }
        .color{
            width: 30px;
            height: 30px;
            background: none;
            border-radius: 50%;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -ms-border-radius: 50%;
            -o-border-radius: 50%;
            margin-right: 12px;
            cursor: pointer;
            transition: all 0.5s ease;
            -webkit-transition: all 0.5s ease;
            -moz-transition: all 0.5s ease;
            -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
        }
        .color-black{
            background-color: #242424;
        }
        .color-blue{
            background-color: #085ea0;
        }
        .color-yellow{
            background-color: #FDE74C;
        }
        .color-red{
            background-color: #EB283B;
        }
        .color-white{
            background-color: #ededed;
        }
        .color-brown{
            background-color: rgb(147, 38, 38);
        }
        .color-pink{
            background-color: rgb(203, 105, 199);
        }
        .color-orange{
            background-color: rgb(212, 68, 20);
        }
        .color:hover{
            width: 35px;
            height: 35px;
            box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
        }
        .active-color{
            box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
        }
        .color-groups{
            display: flex;
            padding: 1rem 0;
            display: flex;
            margin-right: 1.25rem; /* Khoảng cách giữa hai sub-category */
            border-right: 1px solid #ccc; /* Màu và độ rộng của đường ngăn cách */
        }
        .my-5 {
            margin-top: 2rem !important;
            margin-bottom: 1rem !important;
        }

        /* category */
        .nav__categories {
            position: relative;
        }

        .category {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 10px;
        }

        .nav__item:hover .category {
            display: block;
        }

        .main-category {
            list-style: none;
            padding: 0;
            display: flex;
            margin: 10px 0;
        }

        .main-category a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            margin-right: 2rem; /* Khoảng cách giữa hai sub-category */
            padding-right: 2rem; /* Tạo đường ngăn cách */
            border-right: 1px solid #ccc; /* Màu và độ rộng của đường ngăn cách */
        }


        .sub-category {
            margin: 10px 0;
        }

        .sub-category a {
            text-decoration: none;
            color: #333;
            display: block;
            font-weight: bold;
        }

        /* Làm đẹp danh sách con con */
        .sub-sub-category {
            list-style: none;
            padding: 0;
            margin: 5px 0;
        }

        .sub-sub-category a {
            text-decoration: none;
            color: #ed7200;
            display: block;
        }
        .sub-sub-sub-category a {
            text-decoration: none;
            color: #676464;
            display: block;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .nav__categories {
                position: static;
            }

            .category {
                position: static;
                display: block;
                box-shadow: none;
            }

            .nav__item:hover .category {
                display: none;
            }

            .sub-category {
                margin: 5px 0;
            }

            .sub-category a {
                font-weight: normal;
            }
        }
        /* user */
        .nav__user {
            position: relative;
        }

        .user {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 1rem;
        }

        .nav__user:hover .user {
            display: block;
        }

        .main-user {
            list-style: none;
            padding: 0;
            display: block;
            margin: 1rem 0;
        }

        .sub-user {
            margin: 1rem 0;
        }

        .sub-user a {
            color: #333;
            font-size: var(--smaller-font-size)
        }

        /* Responsive */
        @media (max-width: 768px) {
            .nav__user {
                position: static;
            }

            .user {
                position: static;
                display: block;
                box-shadow: none;
            }

            .nav__user:hover .user {
                display: none;
            }

            .sub-user {
                margin: 5px 0;
            }

            .sub-user a {
                font-weight: normal;
                font-size: var(--smaller-font-size);
            }

        }

        .home__images{
            display: grid;
            position: relative;
        }

        .home__shoe{
            width: 300px;
            margin-inline: auto;
            margin-left: 14rem;
        }

        .home__circle{
            width: 250px;
            height: 250px;
            background: linear-gradient(180deg,
                hsl(0, 0%, 100%),
                hsl(0, 0%, 96%));
            border-radius: 50%;
            position: absolute;
            inset: 0;
            margin: auto;
            opacity: 0.5;
            padding-right:  -4rem;
        }
        /* Swiper class */
        .swiper{
            margin-inline: initial;
        }

        .swiper-pagitation-bullets.swiper-pagination-horizontal{
            bottom: -2rem;
        }

        .swiper-pagination-bullet{
            width: 1rem;
            height: .25rem;
            border-radius: 1rem;
            background-color: hsl(0, 0%, 70%);
            opacity: 1;
            transition: background-color .3s, width .3s;
        }

        .swiper-pagination-bullet-active{
            width: 1.25rem;
            background-color: hsl(0, 0%, 5%);
        }

        .swiper-pagination-horizontal.swiper-pagination-bullets .swiper-pagination-bullet{
            margin: 0 2px;
        }

        .c_color {
            margin-top: -4rem;
        }
        /* CSS for Buttons in the Header */
        .btn-nav {
            margin-right: 0.5rem; /* Thêm khoảng cách bên phải cho các nút */
        }

    </style>
    <script>
        /*=============== SWIPER SHOE ===============*/
        document.addEventListener("DOMContentLoaded", function () {
            const swiperShoes = new Swiper('.home__swiper', {
                loop: true,
                spaceBetween: 32,
                grabCursor: true,
                effect: 'creative',
                creativeEffect: {
                    prev: {
                        translate: [-100, 0, -500],
                        opacity: 0
                    },
                    next: {
                        translate: [-100, 0, -500],
                        opacity: 0
                    },
                },
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
                autoplay: {
                    delay: 2000,
                },
            });
        });

    </script>


    <body>
        <header class="fixed-top">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">

                <div class="container px-4 px-lg-5">
                    <a class="navbar-brand" href="/PRJProject/home"><img src="/PRJProject/img/logo.png"></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="/PRJProject/home">Home</a></li>


                            <div class="nav__categories">
                                <li class="nav__item">
                                    <a href="#products" class="nav-link">Products</a>
                                    <div class="category">
                                        <ul class="main-category">
                                            <li class="sub-category">
                                                <a href="#">Sneakers</a>
                                                <ul class="sub-sub-category">
                                                    <li>
                                                        <a href="#">Brand</a>
                                                        <ul class="sub-sub-sub-category">
                                                            <c:forEach items="${listC}" var="o">
                                                                <li><a href="/PRJProject/category/${o.category_id}">${o.category_name}</a></li>
                                                                </c:forEach>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <a href="#">Color</a>
                                                        <div class="container c_color">
                                                            <div class="color-content">
                                                                <div class="color-groups">
                                                                    <a class="color color-white active-color" href="/PRJProject/search/white"></a>
                                                                    <a class="color color-black" href="/PRJProject/search/black"></a>
                                                                    <a class="color color-yellow" href="/PRJProject/search/yellow"></a>
                                                                    <a class="color color-blue" href="/PRJProject/search/blue"></a>
                                                                    <a class="color color-red" href="/PRJProject/search/red"></a>
                                                                    <a class="color color-brown" href="/PRJProject/search/brown"></a>
                                                                    <a class="color color-pink" href="/PRJProject/search/pink"></a>
                                                                    <a class="color color-orange" href="/PRJProject/search/orange"></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="sub-category">
                                                <a href="#">Sandals</a>
                                                <ul class="sub-sub-category">
                                                    <li>
                                                        <a href="#">Brand</a>
                                                        <ul class="sub-sub-sub-category">
                                                            <c:forEach items="${listC}" var="o">
                                                                <li><a href="/PRJProject/category/${o.category_id}">${o.category_name}</a></li>
                                                                </c:forEach>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <a href="#">Color</a>
                                                        <div class="container c_color">
                                                            <div class="color-content">
                                                                <div class="color-groups">
                                                                    <a class="color color-white active-color" href="/PRJProject/search/white"></a>
                                                                    <a class="color color-black" href="/PRJProject/search/black"></a>
                                                                    <a class="color color-yellow" href="/PRJProject/search/yellow"></a>
                                                                    <a class="color color-blue" href="/PRJProject/search/blue"></a>
                                                                    <a class="color color-red" href="/PRJProject/search/red"></a>
                                                                    <a class="color color-brown" href="/PRJProject/search/brown"></a>
                                                                    <a class="color color-pink" href="/PRJProject/search/pink"></a>
                                                                    <a class="color color-orange" href="/PRJProject/search/orange"></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </div>




                            <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                            <li>
                                <a class="nav-link" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            </li>
                        </ul>
                        <form action="/PRJProject/search" method="post" class="search-bar ml-3 btn-nav">
                            <input oninput="searchByName(this)" value="${txtS}" name="txt" type="text" placeholder="Search..." />
                            <button  type="submit"><i class="bx bx-search"></i></button>
                        </form>
                        <form action="/PRJProject/showcart" method="post" class="btn-nav">
                            <button class="btn btn-outline-dark" type="submit">
                                <i class="bi-cart-fill me-1"></i>
                                Cart
                                <span id="cartQuantity" class="badge bg-dark text-white ms-1 rounded-pill">${size}</span>
                            </button>
                        </form>

                        <c:if test="${sessionScope.quantri == null}">
                            <button class="btn btn-outline-dark" type="submit" value="Login" name="btnLogin" id="btnLogin">
                                <a class="nav-link" href="/PRJProject/login">Login</a>
                            </button>
                        </c:if>



                        <c:if test="${sessionScope.quantri != null}">
                            <form action="/PRJProject/showFavorite" method="post" class="btn-nav">
                                <button class="btn btn-outline-dark" type="submit">
                                    <i class="bi-heart-fill me-1"></i> <!-- Biểu tượng trái tim (thay đổi biểu tượng tùy theo sở thích) -->
                                    Favorite
                                    <span id="favoriteQuantity" class="badge bg-dark text-white ms-1 rounded-pill">${favoriteSize}</span>
                                </button>
                            </form>
                            <button class="btn btn-outline-dark btn-nav" type="submit" value="orderhistory" name="btnLogin" id="btnLogin">
                                <a class="nav-link" href="/PRJProject/orderhistory"> <i class="bi-file-earmark-text me-1"></i>OrderHistory</a>
                            </button>

                            <div class="nav__user btn btn-outline-dark btn-nav">
                                <i class='bx bx-user-circle'></i>
                                <div class="user">
                                    <ul class="main-user">
                                        <li class="sub-user">  
                                            <button class="btn btn-outline-dark" type="submit" value="Login" name="btnLogin" id="btnInfoAccount">
                                                <a class="nav-link" href="/PRJProject/infoAccount">
                                                    <i class='bx bxs-user-account'></i> ${sessionScope.quantri.fullname}
                                                </a>
                                            </button> 
                                        </li>
                                        <li class="sub-user"> 
                                            <button class="btn btn-outline-dark" type="submit" value="Login" name="btnLogin" id="btnChangePass">
                                                <a class="nav-link" href="/PRJProject/changepass">Change Password</a>
                                            </button> 
                                        </li>
                                        <li class="sub-user"> 
                                            <button class="btn btn-outline-dark" type="submit" value="Login" name="btnLogin" id="btnLogout">
                                                <a class="nav-link" href="/PRJProject/logout">Logout</a>
                                            </button> 
                                        </li>
                                        <li class="sub-user"> 
                                            <c:if test="${sessionScope.quantri.isAdmin == 1}">
                                                <button class="btn btn-outline-dark" type="submit" value="Login" name="btnLogin" id="btnLogin">
                                                    <a class="nav-link" href="/PRJProject/manager">Manager Product</a>
                                                </button>
                                            </c:if>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </nav>
        </header>

        <!-- Header-->
        <header class="bg-dark py-5">
            <div style="display: grid; grid-template-columns: 1fr 1fr;">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">Best product in our store</h1>
                        <p class="lead fw-normal text-white-50 mb-0">Trendy Products, Factory Prices, Excellent Service</p>
                    </div>
                </div>
                <div class="home__images">
                    <div class="home__circle"></div>
                    <div class="home__swiper swiper">
                        <div class="swiper-wrapper">
                            <article class="home__article swiper-slide">
                                <img src="/PRJProject/img/shoe-1.png" alt="image" class="home__shoe">
                            </article>
                            <article class="home__article swiper-slide">
                                <img src="/PRJProject/img/shoe-2.png" alt="image" class="home__shoe">
                            </article>
                            <article class="home__article swiper-slide">
                                <img src="/PRJProject/img/shoe-3.png" alt="image" class="home__shoe">
                            </article>
                        </div>
                        <!-- If we need pagination -->
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
