<%@page errorPage="Error.jsp" %>
<%@page import="com.hotel.entities.CancelledBooking"%>
<%@page import="com.hotel.dao.CancelledBookingDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.hotel.dao.RoomsCategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hotel.helper.ConnectionProvider"%>
<%@page import="com.hotel.dao.BookingDao"%>
<%@page import="com.hotel.entities.RoomsCategory"%>
<%@page import="com.hotel.entities.BookingDetails"%>
<%@page import="com.hotel.entities.Guest"%>
<%@page import="java.text.*"%>
<%
    Guest guest = (Guest) session.getAttribute("CurrentGuest");
    BookingDao bdao = new BookingDao(ConnectionProvider.getConnection());
    RoomsCategoryDao rdao = new RoomsCategoryDao(ConnectionProvider.getConnection());
    CancelledBookingDao cbdao = new CancelledBookingDao(ConnectionProvider.getConnection());

    ArrayList<BookingDetails> booking_list = bdao.getGuestBookingDetails(guest);
    ArrayList<CancelledBooking> cancelledbooking_list = cbdao.getGuestCancelledBookingDetails(guest);

    if (guest == null) {
        response.sendRedirect("booking.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="./img/WEBSITE ICON 2.png" />
        <title>Atithyam Resort - My Account</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <%@include file="Components/bootstraplink.jsp"%>
        <style>
            body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown), html.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown) 
            { 
                height: 100% !important; overflow-y: visible !important; 
            }
        </style>
    </head>
    <body>

        <!-- navbar -->
        <nav class="navbar navbar-expand-lg bg-custom navbar-custom">
            <a class="navbar-brand" href="index.jsp"><img id="Logo" src="./img/HOTEL ICON.png" alt="Atithyam Resort"/></a>
            <button
                class="navbar-toggler border-dark navbar-light"
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
                >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="About.jsp"><i class="fa fa-user" aria-hidden="true"></i> About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Contact.jsp"> <i class="fa fa-phone-square fa-rotate-90" aria-hidden="true"></i> Contact Us</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-5">

                    <li id = 'usernav' class="nav-item dropdown">
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            id="navbarDropdown"
                            role="button"
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                            > <span id = "username"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;<%=guest.getGuestname()%></span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" id="myaccount" href="booking.jsp"> Book Again</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" id="logout" onclick="Logoutnavbtn()" href="LogoutServlet"><i class="fa fa-sign-in-alt" aria-hidden="true"></i> Logout</a>
                        </div>
                    </li>
                </ul>

            </div>
        </nav>



        <main>
            <div class="container-fluid">
                <div class="container text-center mt-5 "><h3 class="p-3 bg-secondary rounded d-inline-block">Confirmed Bookings</h3></div>
                <div class="container" id="allbookingsdata">
                    <% if (booking_list.isEmpty() != true) {  %>
                    <div class="row">
                        <% for (BookingDetails booking : booking_list) {%>
                        <div class="col-xs-12 col-lg-4">
                            <div class="card mt-5 mt-5" style=" box-shadow: 0px 0px 60px rgba(0,0,0,0.2);">
                                <img class="card-img-top" src="./img/<%= rdao.GetRoomsCategory(booking.getCid()).getCategory()%>.jpeg" alt="<%= rdao.GetRoomsCategory(booking.getCid()).getCategory()%>">
                                <div class="card-body">
                                    <h5 class="card-title p-2 rounded d-inline" style="background: gray;"><%= rdao.GetRoomsCategory(booking.getCid()).getCategory()%></h5>
                                    <p class="card-text mt-4 text-dark">
                                    <ul style="list-style: none">
                                        <li><b>Rooms Booked:</b>&nbsp; <%= booking.getRoomsbooked()%> </li>
                                        <br>
                                        <li><b>Check-In Date:</b>&nbsp; <%= DateFormat.getDateInstance().format(booking.getCheckin())%> </li>
                                        <li><b>Check-Out Date:</b>&nbsp; <%= DateFormat.getDateInstance().format(booking.getCheckout())%> </li>
                                        <br>
                                        <li><b>OCCUPANCY</b></li>
                                        <li><b>No of Adults:</b>&nbsp; <%= booking.getAdults()%></li>
                                        <li><b>No of Kids:</b>&nbsp; <%= booking.getKids()%> </li>
                                        <br>
                                        <li><b>Total Amount:</b>&nbsp;<span><i class="fa fa-<%= booking.getCurrencyvalue().toLowerCase()%>" aria-hidden="true"></i><%= booking.getTotalamount()%></span> </li>
                                        <br>
                                        <li><b>Booking Date:</b>&nbsp; <%= DateFormat.getDateTimeInstance().format(booking.getBookingdate())%> </li>

                                    </ul>
                                    </p>
                                    <div class="container text-center mt-5">
                                        <a href="LoginBookingReceiptServlet?BookingID=<%= booking.getBid()%>" target="_blank" class="btn btn-danger my-2 mx-3" style= "box-shadow: -3px 3px 3px rgba(0,0,0,0.5);">Print Receipt</a>
                                        <a href="#" id="<%= booking.getBid()%>" onclick="alertfunction(this.id);" class="btn btn-danger my-2 mx-3" style= "box-shadow: -3px 3px 3px rgba(0,0,0,0.5);">Cancel Booking</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <% }%>
                    </div>
                    <%} else if (booking_list.isEmpty()) {%>
                    <img id="nothing" class="img-fluid mt-5" src="./img/NothingHere.jpeg" style="display: block; margin-left: auto; margin-right: auto;" />

                    <%
                        }
                    %>

                </div>
            </div>

            <div class="container-fluid my-5">
                <div class="container text-center" ><h3 class="p-3 bg-secondary rounded d-inline-block">Cancelled Bookings</h3></div>

                <div class="container" id="allcancelledbookingsdata">
                    <% if (cancelledbooking_list.isEmpty() != true) {  %>
                    <div class="row">
                        <% for (CancelledBooking cancelledbooking : cancelledbooking_list) {%>
                        <div class="col-xs-12 col-lg-4">
                            <div class="card mt-5 mt-5" style=" box-shadow: 0px 0px 60px rgba(0,0,0,0.2);">
                                <img class="card-img-top" src="./img/<%= rdao.GetRoomsCategory(cancelledbooking.getCid()).getCategory()%>.jpeg" alt="<%= rdao.GetRoomsCategory(cancelledbooking.getCid()).getCategory()%>">
                                <div class="card-body">
                                    <h5 class="card-title p-2 rounded d-inline" style="background: gray;"><%= rdao.GetRoomsCategory(cancelledbooking.getCid()).getCategory()%></h5>
                                    <p class="card-text mt-4 text-dark">
                                    <ul style="list-style: none">
                                        <li><b>Rooms Booked:</b>&nbsp; <%= cancelledbooking.getRoomsbooked()%> </li>
                                        <br>
                                        <li><b>Check-In Date:</b>&nbsp; <%= DateFormat.getDateInstance().format(cancelledbooking.getCheckin())%> </li>
                                        <li><b>Check-Out Date:</b>&nbsp; <%= DateFormat.getDateInstance().format(cancelledbooking.getCheckout())%> </li>
                                        <br>
                                        <li><b>OCCUPANCY</b></li>
                                        <li><b>No of Adults:</b>&nbsp; <%= cancelledbooking.getAdults()%></li>
                                        <li><b>No of Kids:</b>&nbsp; <%= cancelledbooking.getKids()%> </li>
                                        <br>
                                        <li><b>Total Amount:</b>&nbsp;<span><i class="fa fa-<%= cancelledbooking.getCurrencyvalue().toLowerCase()%>" aria-hidden="true"></i><%= cancelledbooking.getTotalamount()%></span> </li>
                                        <br>
                                        <li><b>Booking Date:</b>&nbsp; <%= DateFormat.getDateTimeInstance().format(cancelledbooking.getBookingdate())%> </li>

                                    </ul>
                                    </p>

                                </div>
                            </div>
                        </div>
                        <% }%>
                    </div>
                    <%} else if (cancelledbooking_list.isEmpty()) {%>
                    <img id="nothing" class="img-fluid mt-5" src="./img/NothingHere.jpeg" style="display: block; margin-left: auto; margin-right: auto;" />

                    <%}%>
                </div>
            </div>
        </main>



        <!--scripts-->
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script
            src="https://kit.fontawesome.com/a076d05399.js"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"
        ></script>

        <script>
                                            function alertfunction(clicked_id) {
                                                var clicked_bookinglink = 'CancelBookingServlet?BookingID=' + clicked_id;
                                                Swal.fire({
                                                    title: 'Do you want to cancel your Booking?',
                                                    text: "You won't be able to revert this!",
                                                    icon: 'warning',
                                                    showCancelButton: true,
                                                    confirmButtonColor: '#3085d6',
                                                    cancelButtonColor: '#d33',
                                                    confirmButtonText: 'Yes, delete it!'
                                                }).then((result) => {
                                                    if (result.isConfirmed) {
                                                        window.location.href = clicked_bookinglink;
                                                    }
                                                })
                                                console.log(clicked_id);
                                            }

        </script>

        <script>
            function Logoutnavbtn() {
                $('#loginbuttonnav').show();
                $('#usernav').hide();
            }
        </script>

        <%
//            String Cancelled = "";
//            
//            if (request.getParameter("Cancellation") != null) {
//                    Cancelled = request.getParameter("Cancellation");
//            }
//
//            String Trued = "Done";
            if (session.getAttribute("Cancel") != null) {
        %>
        <script>
            $(document).ready(function () {

                Swal.fire(
                        'Booking Cancelled!',
                        'Your Booking has been cancelled successfully.',
                        'success'
                        );
            }
            );

        </script>
        <%
            session.removeAttribute("Cancel");}
        %>
    </body>
</html>
