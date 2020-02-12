<%-- 
    Document   : shop
    Created on : Aug 18, 2019, 11:21:05 PM
    Author     : Admin
--%>

<%@page import="quang.dto.TypeProductDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="quang.dto.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>TEA-SHOP</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" type="image/png" href="img/Stack_Logo_Transparent_BG_1e71ce46-6894-4a00-bc00-7c4646dc63d5_600x@2x.webp"/>

        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="client/css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="client/css/animate.css">

        <link rel="stylesheet" href="client/css/owl.carousel.min.css">
        <link rel="stylesheet" href="client/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="client/css/magnific-popup.css">

        <link rel="stylesheet" href="client/css/aos.css">

        <link rel="stylesheet" href="client/css/ionicons.min.css">

        <link rel="stylesheet" href="client/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="client/css/jquery.timepicker.css">


        <link rel="stylesheet" href="client/css/flaticon.css">
        <link rel="stylesheet" href="client/css/icomoon.css">
        <link rel="stylesheet" href="client/css/style.css">
        <style>
            .img-fluid {
                min-height: 200px;
                max-height: 200px;
            }
            .form-control:focus, .form-control:active {
                border-color: #ced4da;
            }
            .form-control {
                border-radius: 5px;
            }
            .py-3 {
                padding-bottom: 0.8rem !important;
                padding-top: 0.8rem !important;
            }
            .btn {
                border-radius: 5px;
            }
            .input-group-append {
                margin-left: 5px;
            }
        </style>
    </head>
    <body class="goto-here">
        <%@include file="headerClient.jsp" %>
        <!-- END nav -->

        <section class="ftco-section">
            <!-- Topbar Search -->
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-10 mb-5 text-center">
                        <ul class="product-category">
                            <li><a class="active" href="ProcessController?action=GetListProduct">All</a></li>
                                <% List<TypeProductDTO> listTypeProduct = (ArrayList) request.getAttribute("listTypeProduct");
                                    if (listTypeProduct != null && listTypeProduct.size() > 0) {
                                        for (TypeProductDTO dto : listTypeProduct) {%>
                            <li><a id="<%= dto.getId()%>" href="ProcessController?action=GetListProduct&typeId=<%= dto.getId()%>"><%= dto.getTypeName()%></a></li>
                                <% }
                                    }
                                %>
                        </ul>
                        <ul class="product-category">
                            <li><form action="ProcessController" method="GET" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                    <div class="form-group">
                                        <input type="text" name="searchValue" value="${param.searchValue}" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary py-3" value="GetListProduct" name="action" type="submit">
                                                Search
                                            </button>
                                        </div>
                                    </div>
                                </form></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <%   List<ProductDTO> result = (ArrayList) request.getAttribute("listProduct");
                        DecimalFormat formatter = new DecimalFormat("###,###,###.###");
                        int count = 0;
                        if (result != null && result.size() > 0) {
                            for (ProductDTO dto : result) {%>
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="product">
                            <a href="#" class="img-prod"><img class="img-fluid" src="<%= dto.getImage()%>" alt="Colorlib Template">
                                <span class="status">30%</span>
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3 text-center">
                                <h3><a href="#"><%= dto.getName()%></a></h3>
                                <div class="d-flex">
                                    <div class="pricing">
                                        <p class="price"><span class="price-sale"> VND <%= formatter.format(dto.getPrice())%></span></p>
                                    </div>
                                </div>
                                <div class="bottom-area d-flex px-3">
                                    <div class="m-auto d-flex">
                                        <a href="ProcessController?action=ShoppingCart&id=<%= dto.getId()%>" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                            <span><i class="ion-ios-cart"></i></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }
                        }%>
                </div>
                <!--                <div class="row mt-5">
                                    <div class="col text-center">
                                        <div class="block-27">
                                            <ul>
                                                <li><a href="#">&lt;</a></li>
                                                <li class="active"><span>1</span></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                                <li><a href="#">5</a></li>
                                                <li><a href="#">&gt;</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>-->
            </div>
        </section>

        <section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
            <div class="container py-4">
                <div class="row d-flex justify-content-center py-5">
                    <div class="col-md-6">
                        <h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
                        <span>Get e-mail updates about our latest shops and special offers</span>
                    </div>
                    <div class="col-md-6 d-flex align-items-center">
                        <form action="#" class="subscribe-form">
                            <div class="form-group d-flex">
                                <input type="text" class="form-control" placeholder="Enter email address">
                                <input type="submit" value="Subscribe" class="submit px-3">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="footer.html" %>



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <script src="client/js/jquery.min.js"></script>
        <script src="client/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="client/js/popper.min.js"></script>
        <script src="client/js/bootstrap.min.js"></script>
        <script src="client/js/jquery.easing.1.3.js"></script>
        <script src="client/js/jquery.waypoints.min.js"></script>
        <script src="client/js/jquery.stellar.min.js"></script>
        <script src="client/js/owl.carousel.min.js"></script>
        <script src="client/js/jquery.magnific-popup.min.js"></script>
        <script src="client/js/aos.js"></script>
        <script src="client/js/jquery.animateNumber.min.js"></script>
        <script src="client/js/bootstrap-datepicker.js"></script>
        <script src="client/js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="client/js/google-map.js"></script>
        <script src="client/js/main.js"></script>
        <script>
            function formatConcurrency(x) {
//            var x = 1000;
//            x = x.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
                alert('a');
                console.log(x);
            }
            $(document).ready( function () {
                $(document).scrollTop(300);
            })
              
            <% if (request.getParameter("typeId") != null) { %>
            $(document).ready(function () {
                $('.active').removeClass('active');
                $('#' + ${param.typeId}).addClass('active');
            });
            <% }%>
        </script>
    </body>
</html>
