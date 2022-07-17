<%@page errorPage="Error.jsp" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hotel.dao.RoomsCategoryDao"%>
<%@page import="com.hotel.helper.ConnectionProvider"%>
<%@page import="com.hotel.entities.RoomsCategory"%>
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
    </head>
    <body>
        <!-- navbar -->
        <%@include file="Components/navbar.jsp"%>

        <!--room background-top-->
        <div class="container-fluid room-background"></div>


        <!--<div class="container finalValue" id="price"></div>-->

        <!--About room page-->
        <div class="container mt-5">
            <div class="container-fluid">
                <h1 id="room-heading">ATITHYAM RESORT</h1>
                <p class="room-para">Atithyam Resort, the best hospitality address in the city offers forty eight centrally air conditioned rooms with state of the art 
                    amenities and facilities with an ambience of exclusivity.</p>

                <p class="room-para">Atithyam Resort the preferred resort for travelers on leisure and business alike offers rooms spread across four categories, 
                    Royal Suite, Executive Suite, Deluxe and Standard. All the rooms are aesthetically designed and are equipped with the most modern amenities that 
                    would never make you realize that you are missing feature or a service.</p>
            </div>
        </div>


        <%
//            RoomsCategoryDao rcd = new RoomsCategoryDao(ConnectionProvider.getConnection());
//            RoomsCategory roomscat = null;
        %>

        <%
            RoomsCategoryDao rcd = new RoomsCategoryDao(ConnectionProvider.getConnection());
            List<RoomsCategory> list = rcd.GetRoomsPrice();
        %>


        <!--cards-->
        <div class="container mt-5">
            <!--roomcard deck-1-->
            <div class="card-deck">
                <div class="card mb-3"  style="box-shadow: 0px 0px 10px rgba(0,0,0,0.2);">
                    <img class="card-img-top" src="./img/Royal Suite.jpeg" alt="Royal Suite" oncontextmenu="return false;">
                    <div class="card-body">
                        <h5 class="card-title p-2 rounded d-inline" style="background: gray;"> Royal Suite </h5>
                        <p class="card-text"> 

                        <ul style="list-style: none">
                            <li>King Sized Beds</li>
                            <li>Four Hundred and Fifty Five Square Feet</li>
                            <li>Signature Mattresses</li>
                            <li>Top of the Line Amenities</li>
                            <li>LED Televisions</li>
                            <li>Personalized Mini Refrigerators</li>
                            <li>Tea / Coffee Maker</li>
                            <li>Personal Weight Watcher</li>
                            <li>Electronic Safe Deposit Locker</li>
                            <li>Direct Dial Telephones</li>
                            <li>WiFi Environment</li>
                            <li>Leading Publications</li>
                            <li>Bottled Water on the house</li>
                            <li>Complementary Seasonal Fruits</li>
                            <li><br/>We have equipped the Suite with State of the art Amenities & Facilities.</li>
                            <br>
                            <% // roomscat = rcd.GetRoomsPrice(1); %>
                            <li>Price/Adult: <span class = "final_price"><i class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%= list.get(0).getPrice_person()%></strong></span></li>
                            <li>Price/Child: <span class = "final_price"><i class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%= list.get(0).getPrice_child()%></strong></span>
                                <br><span class="text-muted" style="font-size: 10px;"> *Excluding GST</span><br><span class="text-muted" style="font-size: 10px;"> *Extra charges may apply</span></li>
                        </ul>
                        </p>
                        <div class="container text-center">
                            <p class="card-text"><a href="booking.jsp" class="btn btn-light border-danger"><small>BOOK NOW</small></a></p>
                        </div>
                    </div>
                </div>



                <div class="card mb-3"  style="box-shadow: 0px 0px 10px rgba(0,0,0,0.2);">
                    <img class="card-img-top" src="./img/Executive Suite.jpeg" alt="Executive Suite" oncontextmenu="return false;">
                    <div class="card-body">
                        <h5 class="card-title p-2 rounded d-inline" style="background: gray;"> Executive Suite </h5>
                        <p class="card-text"> 
                            <br/>
                        <ul style="list-style: none">
                            <li>Three Hundred and Fifty Square Feet </li> 
                            <li>King Sized Beds</li> 
                            <li>Signature Mattresses</li> 
                            <li>Top of the Line Amenities</li> 
                            <li>LED Televisions</li> 
                            <li>Personalized Mini Refrigerators</li> 
                            <li>Tea / Coffee Maker</li> 
                            <li>Personal Weight Watcher</li> 
                            <li>Direct Dial Telephones</li> 
                            <li>WiFi Environment</li> 
                            <li>Bottled Water on the house</li> 
                            <li>Complementary Seasonal Fruits</li>
                            <br>
                            <% // roomscat = rcd.GetRoomsPrice(2); %>
                            <li>Price/Adult: <span class = "final_price"><i class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%= list.get(1).getPrice_person()%></strong></span></li>
                            <li>Price/Child: <span class = "final_price"><i class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%= list.get(1).getPrice_child()%></strong></span> 
                                <br><span class="text-muted" style="font-size: 10px;"> *Excluding GST</span><br><span class="text-muted" style="font-size: 10px;"> *Extra charges may apply</li>                        
                        </ul>
                        </p>
                        <br/>
                        <br/>
                        <div class="container text-center">
                            <p class="card-text"><a href="booking.jsp" class="btn btn-light border-danger"><small>BOOK NOW</small></a></p>
                        </div>
                    </div>
                </div>
            </div>

            <!--roomcard deck-2-->
            <div class="card-deck">
                <div class="card mb-3" style="box-shadow: 0px 0px 10px rgba(0,0,0,0.2);" >
                    <img class="card-img-top" src="./img/Deluxe Room.jpeg" alt="Deluxe Room" oncontextmenu="return false;">
                    <div class="card-body">
                        <h5 class="card-title p-2 rounded d-inline" style="background: gray;"> Deluxe Room </h5>
                        <p class="card-text"> 
                            <br>
                        <ul style="list-style: none">
                            <li>Two Hundred and Ninety Square Feet</li> 
                            <li>King Sized Beds</li> 
                            <li>Signature Mattresses</li> 
                            <li>Top of the Line Amenities</li> 
                            <li>LED Televisions</li> 
                            <li>Personalized Mini Refrigerators</li> 
                            <li>Choice of Non – Smoking Room</li> 
                            <li>Direct Dial Telephones</li> 
                            <li>WiFi Environment</li> 
                            <li>Bottled Water on the house</li> 
                            <li>Complementary Seasonal Fruits</li> 
                            <br>
                            <% // roomscat = rcd.GetRoomsPrice(3);%>
                            <li>Price/Adult: <span class = "final_price"><i class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%= list.get(2).getPrice_person()%></strong></span></li>
                            <li>Price/Child: <span class = "final_price"><i class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%= list.get(2).getPrice_child()%></strong></span>
                                <br><span class="text-muted" style="font-size: 10px;"> *Excluding GST</span><br><span class="text-muted" style="font-size: 10px;"> *Extra charges may apply</li>
                            <br/>
                            <div class="container text-center">
                                <p class="card-text"><a href="booking.jsp" class="btn btn-light border-danger"><small>BOOK NOW</small></a></p>
                            </div>
                    </div>
                </div>



                <div class="card mb-3" style="box-shadow: 0px 0px 10px rgba(0,0,0,0.2);" >
                    <img class="card-img-top" src="./img/Standard Room.jpeg" alt="Standard Room" oncontextmenu="return false;">
                    <div class="card-body">
                        <h5 class="card-title p-2 rounded d-inline" style="background: gray;"> Standard Room </h5>
                        <p class="card-text"> 
                            <br>
                        <ul style="list-style: none">
                            <li>Two hundred twenty eight square feet<</li> 
                            <li>King size beds and twin beds</li> 
                            <li>Signature Mattresses</li> 
                            <li>Choice of Non-Smoking Room</
                            <li>Top of the Line Amenities</li> 
                            <li>Personalized Mini Refrigerators</li> 
                            <li>Direct Dial Telephones</li> 
                            <li>WiFi Environment</li> 
                            <li>Bottled Water on the house</li> 
                            <li>Complementary Seasonal Fruits</li> 
                            <li>Leading Publications</li> 
                            <br>
                            <% // roomscat = rcd.GetRoomsPrice(4);%>
                            <li>Price/Adult: <span class = "final_price"><i class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%= list.get(3).getPrice_person()%></strong></span></li>
                            <li>Price/Child: <span class = "final_price"><i class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%= list.get(3).getPrice_child()%></strong></span>
                                <br><span class="text-muted" style="font-size: 10px;"> *Excluding GST</span><br><span class="text-muted" style="font-size: 10px;"> *Extra charges may apply</li>
                            <br/>
                        </ul>
                        </p>

                        <div class="container text-center">
                            <p class="card-text"><a href="booking.jsp" class="btn btn-light border-danger"><small>BOOK NOW</small></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="Components/Footer.jsp"%>

        <%-- scripts --%>
        <%@include file="Components/javascripts.jsp"%>
        
    </body>
</html>
