<%-- 
    Document   : cart
    Created on : Aug 19, 2019, 7:09:39 PM
    Author     : Admin
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>TEA-SHOP</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
            input[type=number]::-webkit-inner-spin-button, 
            input[type=number]::-webkit-outer-spin-button { 
                -webkit-appearance: none; 
                margin: 0; 
            }
            .cart-list {
                overflow: auto;
            }
        </style>
    </head>
    <body class="goto-here">
        <%@include file="headerClient.jsp" %>
        <!-- END nav -->

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
                                            List<CartDTO> cartDTO = (ArrayList<CartDTO>) session.getAttribute("cart");
                                            DecimalFormat formatter = new DecimalFormat("###,###,###.###");
                                            float total = 0;
                                            if (cartDTO != null) {
                                                for (CartDTO dto : cartDTO) {%>
                                        <%

                                            total = total + dto.getTotal();
                                            System.out.println(total);
                                        %>
                                        <tr class="text-center">
                                            

                                            <td class="image-prod"><div class="img" style="background-image:url(<%= dto.getImage()%>);"></div></td>

                                            <td class="product-name">
                                                <input type="hidden" name="id" value="<%= dto.getId()%>"/>
                                                <input type="hidden" name="productName" value="<%= dto.getProductName()%>" />
                                                <h3><%= dto.getProductName()%></h3>
                                            </td>
                                            <td class="price"><%= formatter.format(dto.getPrice())%></td>
                                            <td style="display:none"><input name="price" type="number" value="<%= dto.getPrice()%>" id="price" /></td>

                                            <td class="quantity">
                                                <div class="input-group mb-3">
                                                    <input type="number" name="quantity" onchange="changeQuantity(this)" id="quantity" class="quantity form-control input-number" value="<%= dto.getQuantity()%>" step="0.01" min="1" max="100">
                                                </div>
                                            </td>

                                            <td class="total" id="total"><%= dto.getTotal()%></td>
                                        </tr>
                                        <% }
                                        } else { %>
                                        <tr class="text-center">
                                            <td colspan="6"> Don't have any product in your cart.</td>
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
                                <h3>Cart Totals</h3>
                                <p class="d-flex">
                                    <span>Subtotal</span>
                                    <span id="sub-total"><%= formatter.format(total)%></span>
                                    <input name="subTotal" value="<%= total%>" type="hidden" id="inpTotal"/>
                                </p>
                            </div>
                            <p class="text-right"><button name="action" value="Order" class="btn btn-primary py-3 px-4">Proceed to Checkout</button></p>
                        </div>
                    </div>
                </div>
            </form>
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
                                                        $(document).ready(function () {

                                                            var quantitiy = 0;
                                                            $('.quantity-right-plus').click(function (e) {

                                                                // Stop acting like a button
                                                                e.preventDefault();
                                                                // Get the field name
                                                                var quantity = parseInt($('#quantity').val());

                                                                // If is not undefined

                                                                $('#quantity').val(quantity + 1);


                                                                // Increment

                                                            });

                                                            $('.quantity-left-minus').click(function (e) {
                                                                // Stop acting like a button
                                                                e.preventDefault();
                                                                // Get the field name
                                                                var quantity = parseInt($('#quantity').val());

                                                                // If is not undefined

                                                                // Increment
                                                                if (quantity > 0) {
                                                                    $('#quantity').val(quantity - 1);
                                                                }
                                                            });

                                                        });
                                                        function changeQuantity(e) {
                                                            let price = $(e.parentElement.parentElement.previousElementSibling.firstElementChild).val();
                                                            let total = Math.ceil(price * $(e).val());
                                                            $(e.parentElement.parentElement.nextElementSibling).text(total);
                                                            $('#sub-total').text(0);
                                                            $.map($.makeArray($('.total')), function (x) {
                                                                let subTotal = Math.ceil(parseFloat($('#sub-total').text()) + parseFloat($(x).text()));

                                                                $('#sub-total').text(subTotal);
                                                                $('#inpTotal').val(subTotal);
                                                            });
                                                        }

        </script>

    </body>
</html>
