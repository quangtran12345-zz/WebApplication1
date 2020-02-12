<%-- 
    Document   : index
    Created on : Aug 3, 2019, 8:23:03 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="quang.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My TEA Shop - List User</title>
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

        </style>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="navbar.jsp" %>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <%@include file="headerAdmin.jsp" %>
                    <div class="container-fluid">
                        <h1 class="h3 mb-2 text-center text-gray-800" style="color: #6c7ae0!important">List User</h1>
                        <div class="limiter">
                            <div class="container-table100">
                                <div class="wrap-table100">
                                    <button class="btn py-2 mb-3" id="createNewUser" data-target="#exampleFormModal" data-toggle="modal" style="background-color: #6c7ae0; color: white">Create New User</button>
                                    <div class="table100 ver1 m-b-110">
                                        <div class="table100-head">
                                            <table>
                                                <thead>
                                                    <tr class="row100 head">
                                                        <th class="cell100 column1">No</th>
                                                        <th class="cell100 column2">Name</th>
                                                        <th class="cell100 column3">Username</th>
                                                        <th class="cell100 column4">Role</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>

                                        <div class="table100-body js-pscroll">
                                            <table>
                                                <tbody>
                                                    <%
                                                        List<UserDTO> result = (ArrayList) request.getAttribute("listUser");
                                                        int count = 0;
                                                        if (result != null && result.size() > 0) {
                                                            for (UserDTO dto : result) {%>
                                                    <tr class="row100 body clickable-row" data-href='GetDetailUserController?username=<%= dto.getUsername()%>'>
                                                        <td class="cell100 column1"><%= ++count%></td>
                                                        <td class="cell100 column2"><%= dto.getFullName()%></td>
                                                        <td class="cell100 column3"><%= dto.getUsername()%></td>
                                                        <td class="cell100 column4"><%= (dto.getRole() == 1) ? "admin" : "user"%></td>
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

        <div class="modal fade" id="exampleFormModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Form Create User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="ProcessController" method="POST" class="user">
                        <div class="modal-body">

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">

                                    <input type="text" class="form-control form-control-user" name="firstName" value="${param.firstName}" id="exampleFirstName" placeholder="First Name">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control form-control-user" name="lastName" value="${param.lastName}" id="exampleLastName" placeholder="Last Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" name="usernameCreate" value="${param.usernameCreate}" id="exampleInputEmail" placeholder="Username">
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user" name="password" id="exampleInputPassword" placeholder="Password">
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user" name="confirm" id="exampleRepeatPassword" placeholder="Repeat Password">
                                </div>
                            </div>
                            <!--                            <div class="form-group">
                                                            <label for="exampleFormControlSelect2">Role</label>  
                                                            <select class="form-control" name="role" id="exampleFormControlSelect2">
                                                                <option>--Choose role--</option>
                                                                <option value="0"> User</option>
                                                                <option value="1"> Admin</option>
                                                            </select>
                                                        </div>-->
                            <%if (request.getAttribute("errorMessage") != null) {     
                            %>
                            <h5 style="color:red; text-align: center"><%= request.getAttribute("errorMessage")%> </h5>
                            <script>
//                                document.getElementById('createNewUser').onload = function () {
                                setTimeout(function () {
                                    document.getElementById('createNewUser').click();
                                    document.getElementById('createNewUser').click();
                                }, 200);
//                                };

                            </script>
                            <% }%>
                            <!--<hr>-->
                            <!--                <a href="index.html" class="btn btn-google btn-user btn-block">
                                              <i class="fab fa-google fa-fw"></i> Register with Google
                                            </a>
                                            <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                              <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                            </a-->

                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-secondary py-2" data-dismiss="modal">Close</button>
                            <button type="submit" name="action" value="CreateUser" class="btn btn-primary py-2"> Create Account</button>
                        </div>
                    </form>
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


    </script>
    <!--===============================================================================================-->
    <script src="table/js/main.js"></script>

</html>
