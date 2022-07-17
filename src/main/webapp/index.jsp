<%@page contentType="text/html" pageEncoding="UTF-8" %> 
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

        <div class="hotel-image">
            <div class="hotel-text">
                <h1 id="heading">Feel the difference</h1>
                <h3 id="quotes">
                    Stylish living spaces for business and leisure in lap of the Nature's
                    World!! 
                    <br>
                    Wherever you’re going, wherever you’re from, you’ll discover a home away from home at Atithyam.
                </h3>
            </div>
        </div>

        <div class="container-fluid mt-5 mb-5">
            <div class="row offset-md-1">
                <div class="col-md-5 mb-3">
                    <div class="card " style="box-shadow: 0px 0px 10px rgba(0,0,0,0.2);" >
                        <img class="card-img-top" src="./img/roomcard.jpeg" alt="Rooms">
                        <div class="card-body">
                            <h5 class="card-title text-danger text-center border-top-100 border-danger">Rooms</h5> 
                            <div class="text-center">
                                <a href="rooms.jsp" class="btn btn-danger btn-block" role="button" aria-pressed="true">Learn More About Our Rooms</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-5" >
                    <div class="card" style="box-shadow: 0px 0px 10px rgba(0,0,0,0.2);">
                        <img class="card-img-top" src="./img/restaurantcard.jpeg" alt="Restaurants">
                        <div class="card-body">
                            <h5 class="card-title text-danger text-center">Restaurants</h5> 
                            <div class="text-center">
                                <a href="#" class="btn btn-block btn-danger text-wrap">Learn More About Our Restaurants</a>
                            </div>
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
