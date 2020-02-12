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
        </style>
    </head>
    <body class="goto-here">
        <%@include file="headerClient.jsp" %>
        <!-- END nav -->

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <h1>Order Success</h1>
                    <div class="col-md-10 mb-5 text-center">
                       Your order will be processed as quickly as possible.
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
       
    </body>
</html>
