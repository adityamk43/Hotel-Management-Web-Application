<%@page import="com.hotel.entities.Payment"%>
<%@page errorPage="Error.jsp" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.hotel.entities.RoomsCategory"%>
<%@page import="com.hotel.entities.BookingDetails"%>
<%@page import="com.hotel.entities.Guest"%>
<!DOCTYPE html>
<html lang="en">
    <%

        Guest guest = (Guest) session.getAttribute("Guest");
        BookingDetails booking = (BookingDetails) session.getAttribute("Booking");
        RoomsCategory category = (RoomsCategory) session.getAttribute("Category");
        Payment receipt = (Payment) session.getAttribute("PaymentObject");
        DecimalFormat df = new DecimalFormat("0.00");
        String PaymentDone = "";

//        if (receipt == null || guest==null || booking == null || category == null) {
//            response.sendRedirect("booking.jsp");
//        }
    %>

    <head>
        <meta charset="utf-8">
        <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
        <!--  All snippets are MIT license http://bootdey.com/license -->
        <title>Atithyam Resort - Booking Invoice</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/x-icon" href="./img/WEBSITE ICON 2.png" />
        <!--<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>-->

        <!-- bootstrap and my styles css link -->
        <%@include file="Components/bootstraplink.jsp"%>
        <link rel="stylesheet" href="./Components/CSS/Receipt.css" />

    </head>

    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

        <div class="page-content container">
            <div class="page-header text-blue-d2">
                <h1 class="page-title text-secondary-d1">
                    Receipt
                    <small class="page-info">
                        <i class="fa fa-angle-double-right text-80"></i>
                        ID: #0<%= receipt.getPid()%> 
                    </small>
                </h1>

                <div>
                    <div>
                        <img id="Logo" src="./img/HOTEL ICON.png" alt="Atithyam Resort"/>
                    </div>
                </div>

                <div class="page-tools">
                    <div class="action-buttons">
                        <button id="Print" class="btn bg-white btn-light mx-1px text-95" onclick="window.print();" data-title="Print">
                            <i class="mr-1 fa fa-print text-primary-m1 text-120 w-2"></i>
                            Print
                        </button>
                        <button id="Export" class="btn bg-white btn-light mx-1px text-95" onclick="window.print();" data-title="PDF">
                            <i class="mr-1 fa fa-file-pdf-o text-danger-m1 text-120 w-2"></i>
                            Export
                        </button>
                    </div>
                </div>
            </div>

            <div class="container px-0">
                <div class="row mt-4">
                    <div class="col-12 col-lg-12">

                        <!-- .row -->

                        <!--                        <hr class="row brc-default-l1 mx-n1 mb-4" />-->

                        <div class="row">
                            <div class="col-sm-6">
                                <div>
                                    <span class="text-sm text-grey-m2 align-middle">To:</span>
                                    <span class="text-600 text-110 text-blue align-middle"><%= guest.getGuestname()%></span>
                                </div>
                                <div class="text-grey-m2">
                                    <div class="my-1"><i class="fa fa-phone fa-flip-horizontal text-secondary"></i> <b class="text-600"><%= guest.getMobileno()%></b></div>
                                </div>
                                <div class="datediv my-4"><span class="dates">Check-In:&nbsp;</span><span id="checkindate"><%= DateFormat.getDateInstance().format(booking.getCheckin())%></span>&nbsp;<span class="dates">Check-Out:&nbsp;</span><span id="checkoutdate"><%= DateFormat.getDateInstance().format(booking.getCheckout())%></span></div>

                            </div>
                            <!-- /.col -->

                            <div class="text-95 col-sm-6 align-self-start d-sm-flex justify-content-end">
                                <hr class="d-sm-none" />
                                <div class="text-grey-m2">
                                    <div class="mt-1 mb-2 text-secondary-m1 text-600 text-125">
                                        Receipt
                                    </div>

                                    <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">ID:</span> #0<%= receipt.getPid()%></div>

                                    <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">Issue Date:</span><%= DateFormat.getDateTimeInstance().format(booking.getBookingdate())%></div>

                                    <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">Status:</span> <span class="badge badge-success badge-pill px-25">Paid</span></div>
                                </div>
                            </div>
                            <!-- /.col -->
                        </div>

                        <table class="table table-bordered my-3">

                            <tr>
                                <th scope="row" style="width: 50%;">Room Category</th>
                                <td><%= category.getCategory()%></td>
                            </tr>
                            <tr>
                                <th scope="row" style="width: 50%;">No of Rooms</th>
                                <td><%= booking.getRoomsbooked()%></td>
                            </tr>
                        </table>
                        <h5 >Occupancy</h5>
                        <table class="table table-bordered">
                            <tr>
                                <th scope="row" style="width: 50%;">Adults</th>
                                <td><%= booking.getAdults()%></td>
                            </tr>
                            <tr>
                                <th scope="row"  style="width: 50%;">Kids</th>
                                <td><%= booking.getKids()%></td>
                            </tr>
                        </table>


                        <div class="row mt-3">
                            <div class="col-12 col-sm-7 text-grey-d2 text-95 mt-2 mt-lg-0">
                                Above payment was done securely to Atithyam Resort..
                            </div>

                            <div class="col-12 col-sm-5 text-grey text-90 order-first order-sm-last">
                                <div class="row my-2">
                                    <div class="col-7 text-right">
                                        Total Room Price
                                    </div>
                                    <div class="col-5">
                                        <span class="text-100 text-secondary-d1"><i class="fa fa-<%= booking.getCurrencyvalue().toLowerCase()%>" aria-hidden="true"></i><%= df.format((booking.getTotalamount() / 1.1))%></span>
                                    </div>
                                </div>

                                <div class="row my-2">
                                    <div class="col-7 text-right">
                                        GST (10%)
                                    </div>
                                    <div class="col-5">
                                        <span class="text-90 text-secondary-d1"><i class="fa fa-<%= booking.getCurrencyvalue().toLowerCase()%>" aria-hidden="true"></i><%= df.format((booking.getTotalamount()) - (booking.getTotalamount() / 1.1))%></span>
                                    </div>
                                </div>

                                <div class="row my-2 align-items-center bgc-primary-l3 p-2">
                                    <div class="col-7 text-right">
                                        Total Amount
                                    </div>
                                    <div class="col-5">
                                        <span class="text-130 text-success-d3 opacity-2"><i class="fa fa-<%= booking.getCurrencyvalue().toLowerCase()%>" aria-hidden="true"></i><%= booking.getTotalamount()%></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr />

                        <div>
                            <span class="text-secondary-d1 text-105">Thank you for your business</span>
                            <%if (request.getParameter("Payment") != null) {%>
                            <a href="booking.jsp" id="backbtn" class="btn btn-info btn-bold px-4 float-right mt-3 mt-lg-0">Go Back to Booking Page</a>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <%-- scripts --%>

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

    <script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <%
        if (request.getParameter("Payment") != null) {
            PaymentDone = request.getParameter("Payment");
        }
        String Trued = "Success";
        if (PaymentDone.equalsIgnoreCase(Trued)) {
    %>
    <script>
                            $(document).ready(function () {
                                swal({
                                    title: "Payment Successful!",
                                    text: "Thank You For Booking",
                                    icon: "success",
                                    button: "OK",
                                });
                            });
    </script>
    <%
        }
    %>



    <%
        session.removeAttribute("Guest");
        session.removeAttribute("Booking");
        session.removeAttribute("Category");
        session.removeAttribute("PaymentObject");
    %>
</body>
</html>