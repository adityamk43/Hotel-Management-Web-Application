<%@page import="com.hotel.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="./img/WEBSITE ICON 2.png" />
        <title>Atithyam Resort Rooms</title>
        <!--        <meta charset="UTF-8" />-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- bootstrap and my styles css link -->
        <%@include file="Components/bootstraplink.jsp"%>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <style>
            em{
                color: red;
            }
            body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown), html.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown) 
            { 
                height: 100% !important; overflow-y: visible !important; 
            }
        </style>

    </head>
    <body id="body">
        <!-- navbar -->
        <%@include file="Components/navbar.jsp"%>

        <!--room background-top-->
        <div class="container-fluid contact-background" data-rellax-speed="-4" id="main1"></div>

        <div class="container" style="padding-top: 5%; padding-bottom: 5%;">
            <div class="row">
                <iframe width="1200" height="300" frameborder="0" style="border:0" allowfullscreen src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1830.4459834057593!2d85.14324240866083!3d23.42826940170424!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa0ce4ca8a9c915e3!2zMjPCsDI1JzQzLjQiTiA4NcKwMDgnNDAuOCJF!5e0!3m2!1sen!2sin!4v1646947016248!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <h6 class="p-2 border-danger rounded d-inline-block" style="background: gray; margin-down=10px;">ADDRESS</h6>
                    <p>
                        Brambe
                        <br />
                        Ranchi, Jharkhand 835205
                    </p>
                    <div class="dropdown-divider"></div>
                    <h6 class="p-2 border-danger rounded d-inline-block" style="background: gray; margin-down=10px;">TELEPHONE</h6>
                    <p>
                        <strong>Hotel</strong> +91 7982177620<br />
                        <strong>Fax:</strong>+91 9015321713</p>
                    <div class="dropdown-divider"></div>
                    <h6 class="p-2 border-danger rounded d-inline-block" style="background: gray; margin-down=10px;">EMAIL</h6>
                    <p>
                        <a href="mailto:aditya.bhardwaj3@s.amity.edu" style="color:black">aditya.bhardwaj3@s.amity.edu</a><br>
                        <a href="mailto:adityamk43@gmail.com" style="color:black"> adityamk43@gmail.com</a>
                    </p>
                    <div class="dropdown-divider"></div>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8">
                    <h6 class="p-2 border-danger rounded d-inline-block" style="background: gray; margin-down=10px;">Send us a message</h6>
                    <div class="">
                        <p class="">
                            Your email address will be held strictly confidential.
                            <br />
                            Required fields are marked *</p>
                        <div class="dropdown-divider"></div>
                        <form id="queryform" action="UserFeedbackServlet" method="post">
                            <div class="form-row">
                                <div class="col">
                                    <label for="fname">First Name<em>*</em></label>
                                    <input type="text" name="fname" id="fname" class="form-control" required placeholder="First name">
                                </div>
                                <div class="col">
                                    <label for="lname">Last Name<em>*</em></label>
                                    <input type="text" name="lname" id="lname" class="form-control" required placeholder="Last name">
                                </div>
                            </div>
                            <div class="form-row mt-3">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Email Address<em>*</em></label>
                                    <input type="email" name="emailid" class="form-control" id="inputEmail4" required placeholder="Email">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputMobNo">Mobile Number<em>*</em></label>
                                    <input type="text" pattern="^\d{10}$" name="mobileno" class="form-control" id="inputMobNo" required placeholder="Mobile Number">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="FormControlTextarea1">Your Query<em>*</em></label>
                                <textarea class="form-control" name="userqueries" id="FormControlTextarea1" required rows="3"></textarea>
                            </div>

                            <button type="submit" class="btn btn-info">Submit</button>
                            <button type="reset" class="btn btn-danger"><i class="fa-solid fa-rotate fa-spin"></i>&nbsp;&nbsp;Reset Form</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="Components/Footer.jsp"%>

        <%-- scripts --%>
        <%-- <script type="text/javascript" src="./Components/MyJavaScript/parallexscrolling.js"></script> --%>
        <%@include file="Components/javascripts.jsp"%>
        <script>
            $(document).ready(function () {
                console.log("loaded...");

                $('#queryform').on('submit', function (event) {

                    event.preventDefault();

                    let form = new FormData(this);

                    //send query servlet
                    $.ajax({

                        url: "UserFeedbackServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $('#queryform').trigger("reset");

                            if (data.trim() === "QuerySubmitted") {
                                Swal.fire('Saved!', 'Your Query Have Been Submitted Successfully', 'success');
                            } else {
                                Swal.fire('Error!', data, 'error');
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#queryform').trigger("reset");
                            console.log(jqXHR);
                            Swal.fire('Error!', data, 'error');
                        },
                        processData: false,
                        contentType: false
                    });
                });

            });
        </script>
    </body>
</html>
