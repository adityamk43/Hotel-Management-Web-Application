<%@page errorPage="Error.jsp" %>
<%@page import="java.text.DateFormat"%>
<%@page import="com.hotel.entities.BookingDetails"%>
<%@page import="com.hotel.entities.RoomsCategory"%>
<%@page import="com.hotel.entities.Guest"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <title>Payment Method - Atithyam Resort</title>
        <link rel="icon" type="image/x-icon" href="./img/WEBSITE ICON 2.png" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link href="./Components/CSS/PaymentMethod.css" rel="stylesheet">
    </head>

    <%
        BookingDetails booking = (BookingDetails) session.getAttribute("Booking");
        RoomsCategory category = (RoomsCategory) session.getAttribute("Category");

    %>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="wrapper wrapper-content animated fadeInRight">

                <div class="row">

                    <div class="col-lg-12">

                        <div class="ibox">
                            <div class="ibox-title">
                                Payment method
                            </div>
                            <div class="ibox-content">

                                <div class="panel-group payments-method" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="pull-right">
                                                <i class="fa fa-cc-paypal text-success"></i>
                                            </div>
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">PayPal</a>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse">
                                            <div class="panel-body">

                                                <div class="row">
                                                    <div class="col-md-10">
                                                        <h2>Summary</h2>
                                                        <strong>Room Category:</strong> <%= category.getCategory()%> <br>
                                                        <strong>Rooms Booked:</strong> <%= booking.getRoomsbooked()%> <br><br>
                                                        <strong>Check-In:</strong> <%= DateFormat.getDateInstance().format(booking.getCheckin())%> <br>
                                                        <strong>Check-Out:</strong> <%= DateFormat.getDateInstance().format(booking.getCheckout())%> <br><br>
                                                        <strong>OCCUPANCY:</strong><br>
                                                        <strong>No of Adults:</strong> <%= booking.getAdults()%> <br>
                                                        <strong>No of Kids:</strong> <%= booking.getKids()%> <br><br>
                                                        <strong>Total Amount(Including GST):</strong> <span class="text-navy"><i class="fa fa-<%= booking.getCurrencyvalue().toLowerCase()%>" aria-hidden="true"></i><%= booking.getTotalamount()%></span><br><br>

                                                        <form action="PaymentServlet" method="post">
                                                            <input type="hidden" name="paymentmethod1" value="Paypal">
                                                            <button onclick="Success();" class="btn btn-success">
                                                                <i class="fa fa-cc-paypal">
                                                                    Purchase via PayPal
                                                                </i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="pull-right">
                                                <i class="fa fa-cc-amex text-success"></i>
                                                <i class="fa fa-cc-mastercard text-warning"></i>
                                                <i class="fa fa-cc-discover text-danger"></i>
                                            </div>
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Credit Card</a>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse in">
                                            <div class="panel-body">

                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <h2>Summary</h2>
                                                        <strong>Room Category:</strong> <%= category.getCategory()%> <br>
                                                        <strong>Rooms Booked:</strong> <%= booking.getRoomsbooked()%> <br><br>
                                                        <strong>Check-In:</strong>  <%= DateFormat.getDateInstance().format(booking.getCheckin())%> <br>
                                                        <strong>Check-Out:</strong>  <%= DateFormat.getDateInstance().format(booking.getCheckout())%> <br><br>
                                                        <strong>OCCUPANCY:</strong><br>
                                                        <strong>No of Adults:</strong> <%= booking.getAdults()%> <br>
                                                        <strong>No of Kids:</strong> <%= booking.getKids()%> <br><br>
                                                        <strong>Total Amount(Including GST):</strong> <span class="text-navy"><i class="fa fa-<%= booking.getCurrencyvalue().toLowerCase()%>" aria-hidden="true"></i><%= booking.getTotalamount()%></span><br><br>
                                                    </div>
                                                    <div class="col-md-8">

                                                        <form role="form" id="payment-form" action="PaymentServlet2" method="post">
                                                            <input type="hidden" name="paymentmethod2" value="CreditCard">
                                                            <div class="row">
                                                                <div class="col-xs-12">
                                                                    <div class="form-group">
                                                                        <label>CARD NUMBER</label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control" name="Number" placeholder="Valid Card Number" required="">
                                                                            <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-xs-7 col-md-7">
                                                                    <div class="form-group">
                                                                        <label>EXPIRATION DATE</label>
                                                                        <input type="text" class="form-control" name="Expiry" placeholder="MM / YY" required="">
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-5 col-md-5 pull-right">
                                                                    <div class="form-group">
                                                                        <label>CVV</label>
                                                                        <input type="text" class="form-control" name="CVV" placeholder="CVV" required="">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-xs-12">
                                                                    <div class="form-group">
                                                                        <label>NAME OF CARD</label>
                                                                        <input type="text" class="form-control" name="nameCard" placeholder="NAME AND SURNAME">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-xs-12">
                                                                    <button class="btn btn-primary" type="submit">Make a payment!</button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
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
</html>