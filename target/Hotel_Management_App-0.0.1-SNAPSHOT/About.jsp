<%@page import="com.hotel.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="./img/WEBSITE ICON 2.png" />
        <title>Atithyam Resort About</title>
        <!--        <meta charset="UTF-8" />-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- bootstrap and my styles css link -->
        <%@include file="Components/bootstraplink.jsp"%>
    </head>
    <body id="body">
        <!-- navbar -->
        <%@include file="Components/navbar.jsp"%>

        <!--about background-top-->
        <div class="container-fluid about-background" id = "parallexscrolling"></div>

        <!--about content-->
        <div class="container mt-5">
            <p> From very humble beginnings, Atithyam Resort was established in March 2021 with the opening of the landmark Atithyam Resort in Brambe, Ranchi.

                Atithyam Resort with its signature architecture, in no time established itself as the market leader in the city. The Resort is synonymous with style, class and services which are of a truly international standard.

                In January 2022, another first class business hotel was opened to give the corporate traveler more choice and affordable quality, top of the line accommodation.

                Atithyam Resort is truly a Resort which showcases the best of contemporary interiors, unmatched services and cater to all of your business needs.

                The group has got ambitious growth plans and would always strive to be market leaders in the region they operate.
            </p>

            <h5>Every Moment Matters</h5>
            <p>    Atithyam Resort is one of the world's largest and most dynamic resort with nine distinctive resort brands counting more than 1,600 hotels in operation and under development around the world. We’re committed to delivering memorable moments, acting as a true host, and being the best partner to guests, owners, and talent. 

                Our Resort offer a differentiated, 360-degree guest experience empowered by a Yes I Can! service philosophy to ensure our guests feel at ease, provide offerings that are true to the locale, create memorable experiences, spontaneous surprises, and thoughtful gestures whilst guests can count on consistent delivery of the essentials with our brilliant basics. 

                At Atithyam Resort Group we bring a refreshed commitment to hospitality leadership to meet the ever-evolving travel industry and the bespoke needs of our guests. We provide a Yes I Can! service in all our hotels across the globe and strive to deliver a hospitality experience that is beyond guest expectations.</p>
        
            <h5>About the Developer</h5>
            <p>The developer of this website is the student of Amity University Jharkhand pursuing B. Tech. CSE currently in semester 6 at the time of developing this page. The developer has made many projects throughout his Bachelor Career. And this is his first experience in developing the website.</p>
        </div>

        <!-- Footer -->
        <%@include file="Components/Footer.jsp"%>

        <%-- scripts --%>
        <%@include file="Components/javascripts.jsp"%>
        <script type="text/javascript" src="./Components/MyJavaScript/parallexscrolling.js"></script>
    </body>
</html>
