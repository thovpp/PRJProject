<%-- 
    Document   : home
    Created on : Jun 13, 2023, 11:09:43 PM
    Author     : admin
--%>

<%@page import="Models.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>CARBON SHOP - Home</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- Core theme CSS (includes Bootstrap)-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <link  rel='stylesheet' href='/PRJProject/css/styles.scss'>
        <link rel="stylesheet" href="/PRJProject/css/stylescard.css">
        <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <!--                <script>
                            window.onload = function () {
                                if (window.performance) {
                                    if (performance.navigation.type === 1) {
                                        // Người dùng tải lại trang
                                        window.location.href = "<%=request.getContextPath()%>/home"; // Chuyển hướng đến trang home.jsp
                                    }
                                }
                            };
                        </script>-->

        <style>
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
                margin-top: 3.2rem;
            }
            .color-content h3{
                text-transform: uppercase;
                font-size: 1.6rem;
            }
            .color{
                width: 35px;
                height: 35px;
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
                width: 45px;
                height: 45px;
                box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
            }
            .active-color{
                box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
            }
            .color-groups{
                padding: 1rem 0;
                display: flex;
            }

            .swiper {
                margin-inline: initial;
            }

            .swiper-pagitation-bullets.swiper-pagination-horizontal {
                bottom: -2rem;
            }

            .swiper-pagination-bullet {
                width: 1rem;
                height: .25rem;
                border-radius: 1rem;
                background-color: var(--black-color-light);
                opacity: 1;
                transition: background-color .3s, width .3s;
            }

            .swiper-pagination-bullet-active {
                width: 1.25rem;
                background-color: var(--black-color);
            }

            .swiper-pagination-horizontal.swiper-pagination-bullets .swiper-pagination-bullet {
                margin: 0 2px;
            }
            .grid {
                display: grid;
            }
            .featured__container {
                row-gap: 3rem;
                display: flex;
                flex-wrap: wrap;
                margin-left: 9rem;
                margin-top: 3rem;
            }
            .addToCartButton:hover {
                background-color: whitesmoke;
            }
            .addToCartButton:hover i.bi-heart-fill {
                color: red;
            }
            .card:hover {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transform: translateY(-4px);
            }
            .card-img-top {
                width: 200px; /* Điều chỉnh kích thước tùy ý */
                height: 300px;
                object-fit: cover; /* Đảm bảo hình ảnh không bị méo */
            }
            .card {
                width: 300px; /* Điều chỉnh kích thước tùy ý */
                height: 400px; /* Điều chỉnh kích thước tùy ý */
                padding-bottom: .5rem;
            }
            /*=============== FOOTER ===============*/
            /* Footer Styles */
            .footer {
                padding: 40px 0 30px; /* Thay đổi giá trị padding để cách xa phần trên của footer */
                background-color: #000;
                color: #fff;
                text-align: center;
            }

            .footer__title {
                font-size: 20px;
                margin-bottom: 15px;
            }

            .footer__list,
            .footer__links {
                list-style: none;
                padding: 0;
            }

            .footer__link {
                color: white;
                text-decoration: none;
                transition: color 0.2s;
            }

            .footer__link:hover {
                color: #ff9900;
            }

            .footer__social-link {
                display: inline-block;
                font-size: 24px;
                color: white;
                margin: 0 10px;
                text-decoration: none;
                transition: color 0.2s;
            }

            .footer__social-link:hover {
                color: #ff9900;
            }

            .footer__copy {
                font-size: 14px;
                color: #999;
                margin-top: 30px;
                letter-spacing: 1px; /* Thêm khoảng cách giữa các chữ */
            }

            .sneakerSwiper {
                width: 100%;
                height: 100%;
            }

            .img-swiper {
                text-align: center;
                font-size: 18px;
                background: #fff;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .img-swiper img {
                display: block;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
        </style>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var sneakerswiper1 = new Swiper(".sneaker1Swiper", {
                    spaceBetween: 30,
                    centeredSlides: true,
                    autoplay: {
                        delay: 1700,
                        disableOnInteraction: false
                    }
                });
            });

            document.addEventListener("DOMContentLoaded", function () {
                var sneakerswiper2 = new Swiper(".sneaker2Swiper", {
                    spaceBetween: 30,
                    centeredSlides: true,
                    autoplay: {
                        delay: 1500,
                        disableOnInteraction: false
                    }
                });
            });

        </script>
    </head>
    <body>

        <!-- Navigation-->
        <jsp:include page="header.jsp"/>

        <c:if test="${cate == null}">
            <section class="features-area section_gap">
                <div class="container">
                    <div class="row features-inner">
                        <!-- single features -->
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="single-features">
                                <div class="f-icon">
                                    <img src="<%=request.getContextPath()%>/img/features/f-icon1.png" alt="">
                                </div>



                                <h6>Free Delivery</h6>
                                <p>Free Shipping on all order</p>
                            </div>
                        </div>
                        <!-- single features -->
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="single-features">
                                <div class="f-icon">
                                    <img src="<%=request.getContextPath()%>/img/features/f-icon2.png" alt="">
                                </div>
                                <h6>Return Policy</h6>
                                <p>Free Shipping on all order</p>
                            </div>
                        </div>
                        <!-- single features -->
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="single-features">
                                <div class="f-icon">
                                    <img src="<%=request.getContextPath()%>/img/features/f-icon3.png" alt="">
                                </div>
                                <h6>24/7 Support</h6>
                                <p>Free Shipping on all order</p>
                            </div>
                        </div>
                        <!-- single features -->
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="single-features">
                                <div class="f-icon">
                                    <img src="<%=request.getContextPath()%>/img/features/f-icon4.png" alt="">
                                </div>
                                <h6>Secure Payment</h6>
                                <p>Free Shipping on all order</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Navigation-->

            <!-- Start category Area -->
            <section class="category-area">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-md-12">
                            <div class="row">
                                <div class="col-lg-8 col-md-8">
                                    <div class="single-deal">
                                        <div class="overlay"></div>
                                        <div class="swiper sneaker1Swiper">
                                            <div class="swiper-wrapper">
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c1.jpg" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c2.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c3.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c4.jpg" alt=""></div> 
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c5.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c6.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c7.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c8.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c9.png" alt=""></div> 
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c10.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c11.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c12.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c13.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c14.png" alt=""></div> 
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c15.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c16.png" alt=""></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-4">
                                    <div class="single-deal">
                                        <div class="overlay"></div>
                                        <img class="img-fluid w-100" src="<%=request.getContextPath()%>/img/category/d1.jpg" alt="">
                                        <a href="img/category/d2.jpg" class="img-pop-up" target="_blank">
                                            <div class="deal-details">
                                                <h6 class="deal-title">Sneaker for Sports</h6>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="single-deal">
                                        <div class="overlay"></div>
                                        <img class="img-fluid w-100" src="<%=request.getContextPath()%>/img/category/d2.jpg" alt="">
                                        <a href="img/category/d1.jpg" class="img-pop-up" target="_blank">
                                            <div class="deal-details">
                                                <h6 class="deal-title">Sneaker for Sports</h6>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-md-8">
                                    <div class="single-deal">
                                        <div class="overlay"></div>
                                        <div class="swiper sneaker2Swiper">
                                            <div class="swiper-wrapper">
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c1.jpg" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c2.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c3.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c4.jpg" alt=""></div> 
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c5.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c6.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c7.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c8.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c9.png" alt=""></div> 
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c10.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c11.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c12.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c13.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c14.png" alt=""></div> 
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c15.png" alt=""></div>
                                                <div class="img-swiper swiper-slide"><img class="" src="<%=request.getContextPath()%>/img/category/c16.png" alt=""></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="single-deal">
                                <div class="overlay"></div>
                                <img class="img-fluid w-100" src="<%=request.getContextPath()%>/img/category/c5.jpg" alt="">
                                <a href="img/category/a1.jpg" class="img-pop-up" target="_blank">
                                    <div class="deal-details">
                                        <h6 class="deal-title">Every Sale for Everyone</h6>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--==================== FEATURED ====================-->
            <section class="featured section container py-5" id="featured">
                <h2 class="section__title text-center"> FEATURED</h2>
                <p class="text-center">Our best seller, the best item for anyone.</p>

                <div class="featured__container grid">
                    <div class="featured__card">
                        <img src="/PRJProject/images/s4.jpg" alt="" class="card__img">
                        <div class="card__data">
                            <h1 class="card__title">
                                <a class="text-decoration-none text-dark" href="<%=request.getContextPath()%>/details/1081">Air Jordan Satin Shoes Sneakers Nike</a>
                            </h1>
                            <span class="card__price">$234</span>
                            <p class="card__description">Jordan 1 High OG Satin Snake là cái tên vô cùng được quan tâm trong các dòng giày Air Jordan 1 High đã được giới thiệu với công chúng.</p>

                        </div>
                    </div>

                    <div class="featured__card">
                        <img src="/PRJProject/images/s5.jpg" alt="" class="card__img">
                        <div class="card__data">
                            <h1 class="card__title">
                                <a class="text-decoration-none text-dark" href="<%=request.getContextPath()%>/details/1086">Nike AJKO High "Sport Blue"</a>
                            </h1> 
                            <span class="card__price">$125</span>
                            <p class="card__description">Giày Nike AJKO High "Sport Blue" 638471-007. Nike. Giày Nike AJKO High.</p>

                        </div>
                    </div>

                    <div class="featured__card">
                         <img src="/PRJProject/images/s6.jpg" alt="" class="card__img">
                        <div class="card__data">
                            <h1 class="card__title">
                                <a class="text-decoration-none text-dark" href="<%=request.getContextPath()%>/details/1087">Nike Air Max Air Jordan Universit</a>
                            </h1>
                            <span class="card__price">$432</span>
                            <p class="card__description">Air Jordan 1 Retro High OG GS University Blue 575441-134 là một sự kết hợp hoàn hảo giữa sự nổi bật và sự tinh tế.</p>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Section-->
            <section class="py-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-6 text-center">
                            <div class="section-title">
                                <h1>LATEST PRODUCT</h1>
                                <p>These are our newly updated products. Join us to update the latest trends!</p>
                            </div>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4 justify-content-center">
                        <c:forEach items="${list4P}" var="o">
                            <div class="col mb-4">
                                <div class="card h-100">
                                    <!-- Sale badge-->
                                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                    <!-- Product image-->
                                    <a href="<%=request.getContextPath()%>/details/${o.product_id}">
                                        <img class="card-img-top" src="${o.product_pic}" alt="...">
                                    </a>
                                    <!-- Product details-->
                                    <div class="card-body">
                                        <h5 class="card-title"><a class="text-decoration-none text-dark" href="<%=request.getContextPath()%>/details/${o.product_id}">${o.product_name}</a></h5>
                                        <p class="card-text text-muted text-decoration-line-through">$${o.price*1.2}</p>
                                        <p class="card-text">$${o.price}</p>
                                    </div>
                                    <!-- Product actions-->
                                    <div>
                                        <div class="text-center">
                                            <c:if test="${sessionScope.quantri.account_id != null}">
                                                <a class="addToCartButton btn" href="<%=request.getContextPath()%>/favorite?id=${o.product_id}&accid=${sessionScope.quantri.account_id}">
                                                    <i class="bi-heart-fill me-1"></i>  </a>
                                                </c:if>
                                                <c:if test="${sessionScope.quantri.account_id == null}">
                                                <a class="addToCartButton btn" href="<%=request.getContextPath()%>/login">
                                                    <i class="bi-heart-fill me-1"></i>  </a>
                                                </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>


        </c:if>
        <!-- Section-->
        <section class="owl-carousel active-product-area section_gap">
            <div class="single-product-slider">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-6 text-center">
                            <div class="section-title">
                                <h1>PRODUCTS</h1>
                                <p>This is a product in our shop, take a look at it and choose a pair of shoes or sandals that are suitable for you!</p>
                            </div>
                            <a href="<%=request.getContextPath()%>/home">1</a>
                            <c:forEach begin="2" end="${endP}" var="i">
                                <a href="<%=request.getContextPath()%>/listproduct/${i}">${i}</a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="content">
                        <!-- single product -->
                        <c:forEach items="${listP}" var="o">
                            <div class="product col mb-5">
                                <div class="card h-100">
                                    <!-- Sale badge -->
                                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                    <!-- Product image -->
                                    <a href="<%=request.getContextPath()%>/details/${o.product_id}">
                                        <img class="card-img-top" src="${o.product_pic}" alt="...">
                                    </a>
                                    <!-- Product details -->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name -->
                                            <h5 class="fw-bolder">
                                                <a class="text-decoration-none text-dark" href="<%=request.getContextPath()%>/details/${o.product_id}">
                                                    ${o.product_name}
                                                </a>
                                            </h5>
                                            <!-- Product price -->
                                            <span class="text-muted text-decoration-line-through">$${o.price*1.2}</span>
                                            $${o.price}
                                            <h5 class="fw-bolder">${o.product_color}</h5>
                                        </div>
                                    </div>
                                    <!-- Product actions -->
                                    <div class="text-center">
                                        <c:if test="${sessionScope.quantri.account_id != null}">
                                            <a class="addToCartButton btn" href="<%=request.getContextPath()%>/favorite?id=${o.product_id}&accid=${sessionScope.quantri.account_id}">
                                                <i class="bi-heart-fill me-1"></i>  </a>
                                            </c:if>
                                            <c:if test="${sessionScope.quantri.account_id == null}">
                                            <a class="addToCartButton btn" href="<%=request.getContextPath()%>/login">
                                                <i class="bi-heart-fill me-1"></i>  </a>
                                            </c:if>
                                    </div>
                                </div> 
                            </div>
                        </c:forEach>
                    </div>
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                            <button onclick="loadMore()" class="loadMoreButton btn btn-outline-dark mt-auto">Xem Thêm</button>
                        </div>
                    </div>
                    
                    <div class="justify-content-center text-center">
                        <a href="<%=request.getContextPath()%>/home">1</a>
                        <c:forEach begin="2" end="${endP}" var="i">
                            <a href="<%=request.getContextPath()%>/listproduct/${i}">${i}</a>
                        </c:forEach>
                    </div>
                </div> 
            </div>
        </section>


    </section>
    <!-- Footer-->
    <footer class="footer bg-dark text-white">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="footer__content">
                        <h3 class="footer__title">Our Information</h3>
                        <ul class="list-unstyled footer__list">
                            <li>9000 - Can Tho</li>
                            <li>Ninh Kieu Can Tho 3741</li>
                            <li>0876-999-789</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="footer__content">
                        <h3 class="footer__title">About Us</h3>
                        <ul class="list-unstyled footer__links">
                            <li><a href="#" class="footer__link text-white">Support Center</a></li>
                            <li><a href="#" class="footer__link text-white">Customer Support</a></li>
                            <li><a href="#" class="footer__link text-white">About Us</a></li>
                            <li><a href="#" class="footer__link text-white">Copy Right</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="footer__content">
                        <h3 class="footer__title">Product</h3>
                        <ul class="list-unstyled footer__links">
                            <li><a href="#" class="footer__link text-white">Nike</a></li>
                            <li><a href="#" class="footer__link text-white">Adidas</a></li>
                            <li><a href="#" class="footer__link text-white">Converse</a></li>
                            <li><a href="#" class="footer__link text-white">Balenciaga</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="footer__content">
                        <h3 class="footer__title">Social</h3>
                        <ul class="list-unstyled footer__social">
                            <li class="d-inline-block">
                                <a href="https://www.facebook.com/" target="_blank" class="footer__social-link text-white">
                                    <i class="bx bxl-facebook"></i>
                                </a>
                            </li>
                            <li class="d-inline-block">
                                <a href="https://twitter.com/" target="_blank" class="footer__social-link text-white">
                                    <i class="bx bxl-twitter"></i>
                                </a>
                            </li>
                            <li class="d-inline-block">
                                <a href="https://www.instagram.com/" target="_blank" class="footer__social-link text-white">
                                    <i class="bx bxl-instagram"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="text-center">
                        <span class="footer__copy">© All rights reserved</span>
                    </div>
                </div>
            </div>
        </div>
    </footer>


    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <script>
        <%
            Account ac = (Account) session.getAttribute("quantri");
            int accountID = 0;
            if (ac != null) {
                accountID = ac.getAccount_id();
            }
        %>
    </script>




    <script>
        function loadMore() {
            var amount = document.getElementsByClassName("product").length;
            $.ajax({
                url: "<%=request.getContextPath()%>/loadproduct",
                type: "get",
                data: {
                    exits: amount,
                    account_id: <%= accountID%>
                },
                success: function (data) {
                    var row = document.getElementById("content");
                    row.innerHTML += data;
                }
            });
        }

        function searchByName(param) {
            var txtSearch = param.value;
            $.ajax({
                url: "<%=request.getContextPath()%>/searchAjax",
                type: "get",
                data: {
                    txt: txtSearch
                },
                success: function (data) {
                    var row = document.getElementById("content");
                    row.innerHTML = data;
                }
            });
        }

    </script>
</body>
</html>
