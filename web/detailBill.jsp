<%-- 
    Document   : detailProductPage
    Created on : Aug 20, 2019, 8:58:15 PM
    Author     : Admin
--%>

<%@page import="quang.dto.ProductDTO"%>
<%@page import="quang.dto.BillDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="quang.dto.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="quang.dto.TypeProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My TEA Shop - Detail User</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="img/Stack_Logo_Transparent_BG_1e71ce46-6894-4a00-bc00-7c4646dc63d5_600x@2x.webp"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="table/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="table/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="table/vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="table/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="table/vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="table/css/util.css">
        <link rel="stylesheet" type="text/css" href="table/css/main.css">
        <!--===============================================================================================-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <!--<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">-->
        <!-- Custom styles for this template -->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="datepicker/dist/datepicker.min.css" rel="stylesheet" />
        <style>
            input {
                border: 1px solid #d1d3e2!important;
            }
            .navbar-search > .input-group {
                border-radius: 4px;
            }
            .navbar-search > .input-group:focus-within {
                webkit-box-shadow: 0 0 0 0.2rem rgba(78,115,223,.25);
                box-shadow: 0 0 0 0.2rem rgba(78,115,223,.25);
            }

            .navbar-search input:focus {
                box-shadow: none;
                webkit-box-shadow: none;
            }
            .profile-widget-picture {
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="navbar.jsp" %>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <%@include file="headerAdmin.jsp" %>
                    <div class="container-fluid">
                        <h1 class="h3 mb-2 text-center text-gray-800" style="color: #6c7ae0!important">#${requestScope.bill.getId()}</h1>
                       <section class="ftco-section ftco-cart">
            <form action="ProcessController" method="POST">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 ftco-animate">
                            <div class="cart-list">
                                <table class="table">
                                    <thead class="thead-primary">
                                        <tr class="text-center">
                                            <th>&nbsp;</th>
                                            <th>Product name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%
                                            BillDTO bill = (BillDTO) request.getAttribute("bill");
                                            DecimalFormat formatter = new DecimalFormat("###,###,###.###"); 
                                        if (bill != null) {
                                            for (ProductDTO product : bill.getListProducts()) {
                                        %>
                                        <tr class="text-center">
                                            

                                            <td class="image-prod"><div class="img" style="background-image:url(<%= product.getImage() %>);"></div></td>
                                            <td class="product-name">
                                                <input type="hidden" name="productName" value="<%= product.getName()%>" />
                                                <h5><%= product.getName()%></h5>
                                            </td>
                                            <td class="price"><%= product.getPriceFormat() %></td>
                                            <td style="display:none"><input name="price" type="number" value="" id="price" /></td>

                                            <td class="quantity">
                                               <%= product.getQuantity() %>
                                            </td>

                                            <td class="total" id="total"><%= formatter.format(product.getTotal()) %></td>
                                        </tr>
                                        <%
                                            }
                                        } else { %>
                                        <tr class="text-center">
                                            <td colspan="6"> Don't have any product.</td>
                                        </tr>
                                    <%}%>
                                    <!-- END TR-->
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-end">
                        <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
                            <div class="cart-total mb-3">
                                <p class="d-flex">
                                    <span>Subtotal:&nbsp;</span> 
                                    <span id="sub-total"> <%= formatter.format(bill.getSubTotal())%></span>
                                    <input name="subTotal" value="<%= bill.getSubTotal()%>" type="hidden" id="inpTotal"/>
                                </p>
                            </div>
                            <!--<p class="text-right"><button name="action" value="Order" class="btn btn-primary py-3 px-4">Proceed to Checkout</button></p>-->
                        </div>
                    </div>
                </div>
            </form>
        </section>
                    </div>
                </div>
            </div>
        </div>
</html>
<!--===============================================================================================-->	
<script src="table/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="table/vendor/bootstrap/js/popper.js"></script>
<script src="table/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="table/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="table/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="datepicker/dist/datepicker.min.js"></script>
<!--===============================================================================================-->
<script src="table/js/main.js"></script>
