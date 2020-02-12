<%-- 
    Document   : listProductPage
    Created on : Aug 17, 2019, 9:40:26 PM
    Author     : Admin
--%>

<%@page import="quang.dto.BillDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My TEA Shop - List Product</title>
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
        <style>
            .modal-content .modal-body input {
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

            .clickable-row {
                cursor: pointer;
            }
            .curs-poiter {
                cursor: pointer;
            }
            .img_description {
                width: 50px;
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
                        <h1 class="h3 mb-2 text-center text-gray-800" style="color: #6c7ae0!important">List Bills</h1>
                        <div class="limiter">
                            <div class="container-table100">
                                <div class="wrap-table100">
                                    <p class="btn py-2 mb-3" style="background-color: #FFFF; color: white"></p>
                                    <div class="table100 ver1 m-b-110">
                                        <div class="table100-head">
                                            <table>
                                                <thead>
                                                    <tr class="row100 head">
                                                        <th class="cell100 column1">No</th>
                                                        <th class="cell100 column2">Code</th>
                                                        <th class="cell100 column3">User</th>
                                                        <th class="cell100 column4">Sum Price</th>
                                                        <!--<th class="cell100 column5">Image</th>-->
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>

                                        <div class="table100-body js-pscroll">
                                            <table>
                                                <tbody>
                                                     <%
                                                        List<BillDTO> result = (ArrayList) request.getAttribute("listBills");
                                                        System.out.println(result);
                                                        int count = 0;
                                                        if (result != null && result.size() > 0) {
                                                            for (BillDTO dto : result) {%>
                                                    <tr class="row100 body clickable-row" data-href='ProcessController?id=<%= dto.getId()%>&action=GetDetailBill'>
                                                        <td class="cell100 column1"><%= ++count%></td>
                                                        <td class="cell100 column2">#<%= dto.getId()%></td>
                                                        <td class="cell100 column3"><%= dto.getUserName()%></td>
                                                        <td class="cell100 column4"><%= dto.getSubTotal()%> VND</td>
                                                        <!--<td class="cell100 column5"><img class="img_description" src="" /></td>-->
                                                    </tr>
                                                    <% }
                                                    } else { %>
                                                    <tr class="row100 body">
                                                        <td class="cell100 column1 text-center" colspan="5">Record not found</td>
                                                    </tr>
                                                        <% } %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    
    </body>

    <!--===============================================================================================-->	
    <script src="table/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="table/vendor/bootstrap/js/popper.js"></script>
    <script src="table/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="table/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="table/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="js/sb-admin-2.min.js"></script>
    <script>
                                $('.js-pscroll').each(function () {
                                    var ps = new PerfectScrollbar(this);

                                    $(window).on('resize', function () {
                                        ps.update();
                                    });
                                });


                                $(".clickable-row").click(function () {
                                    window.document.location = $(this).data("href");
                                });

                                $(document).ready(function () {
                                    $('#userName').blur(function (event) {
                                        var name = $('#userName').val();
                                        $.get('GetUserServlet', {
                                            userName: name
                                        }, function (responseText) {
                                            $('#ajaxGetUserServletResponse').text(responseText);
                                        });
                                    });
                                });
                                
                                $('#img-product').click(function () {
                                    $('#file').click();
                                });
                                
                                $('#file').change(function (e) {
                                    let image = e.target.files[0];
                                    var reader = new FileReader();
                                    reader.readAsDataURL(image);
                                    reader.onload = function  (evt) {
                                       $('#img-product').attr('src',evt.target.result);
                                       $('#image').val(evt.target.result);
                                    };
                                });
                                
    </script>
    <!--===============================================================================================-->
    <script src="table/js/main.js"></script>
</html>

