<%-- 
    Document   : detailUser
    Created on : Aug 15, 2019, 12:26:33 AM
    Author     : Admin
--%>

<%@page import="quang.dto.UserDTO"%>
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
                        <h1 class="h3 mb-2 text-center text-gray-800" style="color: #6c7ae0!important">Detail User</h1>
                        <div class="row mt-sm-4">
                            <div class="col-12 col-md-12 col-lg-5">
                                <div class="card profile-widget">
                                    <div class="profile-widget-header">                     
                                        <img alt="image" src="https://cdn0.iconfinder.com/data/icons/hexagon-business-flat-part-2/218/Star_Employee_2-512.png" class="rounded-circle profile-widget-picture">
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-12 col-lg-7">
                                <div class="card">
                                    <form method="post" class="needs-validation" action="UpdateUserController">
                                        <div class="card-header">
                                            <h4>Profile</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">                               
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Name</label>
                                                    <input type="text" class="form-control" value="${requestScope.user.getFullName()}" disabled>
                                                </div>
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Username</label>
                                                    <input type="text" class="form-control" value="${requestScope.user.getUsername()}" disabled required="">
                                                </div>
                                            </div>
                                            
                                            <div class="row">
                                           
                        </div>
                    </div>
                    <div class="card-footer text-right">
                      <a class="btn btn-danger py-2" href="ProcessController?username=${param.username}&action=DeleteUser">Delete</a>
                    </div>  
                  </form>
                </div>
              </div>
            </div>
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
    <script>
        $('.js-pscroll').each(function () {
            var ps = new PerfectScrollbar(this);

            $(window).on('resize', function () {
                ps.update();
            });
        });
        $('[data-toggle="datepicker"]').datepicker({
            autoPick: true,
            format: "dd/mm/yyyy"
        });
    </script>
    <!--===============================================================================================-->
    <script src="table/js/main.js"></script>
