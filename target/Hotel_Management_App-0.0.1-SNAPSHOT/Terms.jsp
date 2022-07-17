<%@page import="com.hotel.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="./img/WEBSITE ICON 2.png" />
        <title>Atithyam Resort</title>
        <!--        <meta charset="UTF-8" />-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- bootstrap and my styles css link -->
        <%@include file="Components/bootstraplink.jsp"%>
    </head>
    <body>
        <!-- navbar -->
        <%@include file="Components/navbar.jsp"%>
        <!--about background-top-->
        <div class="container-fluid about-background" id = "parallexscrolling"></div>


        <div class="container mt-5" id="terms-privacy-font">
            <div class="row">

                <div class="col-lg-12">
                    <p class="pm-news-post-excerpt">
                        <br>

                        Our Standard Terms & Conditions for Room Reservation in the Resort.  
                    <p>
                    <ul id="privacy">
                        <li><i class="fa fa-certificate" aria-hidden="true">Our check-in/Check-out time is 12:00 Noon.</i> </li>


                        <li><i class="fa fa-certificate" aria-hidden="true">Reservations will be deemed as guaranteed up to 1500Hrs only or unless specified.</i></li>

                        <li><i class="fa fa-certificate" aria-hidden="true">Late checkouts are granted by prior approvals only, till 1400 Hrs after which a day’s charge will be levied.</i> </li>
                        <li><i class="fa fa-certificate" aria-hidden="true">Any changes in the tax structure would be levied as applicable.</i> </li>
                        <li><i class="fa fa-certificate" aria-hidden="true"> Telephonic Reservations</i> </li>
                        All telephonic reservation requests will be held on tentative basis and a written confirmation is required by the Resort to confirm the reservation within the time given by the Reservation Department



                        <li><i class="fa fa-certificate" aria-hidden="true">All reservation confirmation should have the arrival details along with contact number, preferably the mobile number of the guest to minimize inconvenience to the guest on arrival.</i> </li>

                        <li><i class="fa fa-certificate" aria-hidden="true">For early morning arrivals, the room will be booked and charged from previous night or else the room will be allocated as per the availability. </i> </li>

                        <li><i class="fa fa-certificate" aria-hidden="true">Cancellation Information</i>  </li>
                        All cancellation information should be sent at least 48 hours before, through a letter / facsimile / mail for individual bookings and 10 days prior to arrival in the case of group booking of a minimum 05 rooms.


                        <li><i class="fa fa-certificate" aria-hidden="true">One night room rent will be charged as Retention Charges for last moment cancellations, No show   charge/tariff rate will be sent to your Company for payment.</i> </li>

                        <li><i class="fa fa-certificate" aria-hidden="true">All guests have to settle their bills directly, before checking out, either by cash or card. The Resort does not honor personal cheques.</i> </li>


                        <li><i class="fa fa-certificate" aria-hidden="true">Credit Facility</i>  </li>
                        The credit facility is applicable only for the Companies who are in the approved list of the Resort. For any bills to company the same should be mentioned in the reservation confirmation mail / fax / letter mentioning the details. Billing letter is required to send bills to your company.


                        <li><i class="fa fa-certificate" aria-hidden="true">You will appreciate that the Resort reserves the right to cancel/decline any non-guaranteed reservation in case of any exigencies, renovation work, malfunctioning.</i> </li>


                        <li><i class="fa fa-certificate" aria-hidden="true">In case of a missing key, INR 1500 will be charged directly to guest or to the Company. </i> </li>
                        <li></li>
                    </ul></p>
                    </p>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="Components/Footer.jsp"%>

        <%-- scripts --%>
        <%@include file="Components/javascripts.jsp"%>
    </body>
</html>
