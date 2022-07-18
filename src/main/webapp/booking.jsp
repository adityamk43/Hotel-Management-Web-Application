<%@page errorPage="Error.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.hotel.entities.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hotel.dao.RoomsCategoryDao"%>
<%@page import="com.hotel.helper.ConnectionProvider"%>
<%@page import="com.hotel.entities.RoomsCategory"%>
<%@page import="com.hotel.entities.BookingDetails"%>
<%@page import="com.hotel.entities.Guest"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<%
RoomsCategoryDao rcd = new RoomsCategoryDao(ConnectionProvider.getConnection());
List<RoomsCategory> list = rcd.GetRoomsPrice();
//            RoomsCategory roomscat = null;

Guest guest = (Guest) session.getAttribute("CurrentGuest");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/x-icon" href="./img/WEBSITE ICON 2.png" />
<title>Atithyam Resort-Bookings</title>
<!--        <meta charset="UTF-8" />-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- bootstrap and my styles css link -->
<%@include file="Components/bootstraplink.jsp"%>
<link rel="stylesheet" href="./Components/CSS/bookingcss.css" />
<!--daterangepicker-->
<link href="./Components/CSS/daterangepicker.css" rel="stylesheet" />

</head>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg bg-custom navbar-custom">
		<a class="navbar-brand" href="index.jsp"><img id="Logo"
			src="./img/HOTEL ICON.png" alt="Atithyam Resort" /></a>
		<button class="navbar-toggler border-dark navbar-light" type="button"
			data-toggle="collapse" data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i>
						Home <span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="About.jsp"><i
						class="fa fa-user" aria-hidden="true"></i> About Us</a></li>
				<li class="nav-item"><a class="nav-link" href="Contact.jsp">
						<i class="fa fa-phone-square fa-rotate-90" aria-hidden="true"></i>
						Contact Us
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle currency-name" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">
						<span id="currency-name">
							<%--Currency --%>
					</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item currency-type" id="INR"
							onclick="currencychange(this.id); getResults(); getCurrencyId(this.id); BookingLogic();"
							href="#"> <i class="fa fa-inr" aria-hidden="true"></i> INR
						</a> <a class="dropdown-item currency-type" id="USD"
							onclick="currencychange(this.id); getResults(); getCurrencyId(this.id); BookingLogic();"
							href="#"> <i class="fa fa-usd" aria-hidden="true"></i> USD
						</a>
						<!--                    <div class="dropdown-divider"></div>-->
						<a class="dropdown-item currency-type" id="EUR"
							onclick="currencychange(this.id); getResults(); getCurrencyId(this.id); BookingLogic();"
							href="#"> <i class="fa fa-eur" aria-hidden="true"></i> EUR
						</a>
					</div></li>
			</ul>
			<ul class="navbar-nav mr-5">
				<li id="loginbuttonnav" class="nav-item"><a class="nav-link"
					href="#" onclick="BackToLoginForm();" data-toggle="modal"
					data-target="#LoginModal"><i class="fa fa-sign-in-alt"
						aria-hidden="true"></i> Login</a></li>
				<%
				if (guest != null) {
				%>
				<%@include file="Components/userloginnavbutton.jsp"%>
				<script>
                        console.log("<%=guest.getGuestname()%>");
                        $('#loginbuttonnav').hide();
                        $('#username').html('<i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;' + "<%=guest.getGuestname()%>
					");
				</script>
				<%
				}
				%>
				<li class="nav-item"><a class="nav-link" href="booking.jsp"><i
						class="fa fa-dot-circle-o" aria-hidden="true"></i> Book Now</a></li>
				<li class="nav-item"><a class="nav-link" href="rooms.jsp"><i
						class="fa fa-dot-circle-o" aria-hidden="true"></i> Rooms</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa fa-dot-circle-o" aria-hidden="true"></i> Restaurant</a></li>
			</ul>
			<%-- <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li> --%>
			<!--        <form class="form-inline my-2 my-lg-0">
                            <input
                                class="form-control mr-sm-2"
                                type="search"
                                placeholder="Search"
                                aria-label="Search"
                                />
                            <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">
                                Search
                            </button>
                        </form>-->
		</div>
	</nav>


	<div id="datecontainer"></div>

	<!--about background-top with checkin and checkout date range picker-->
	<div class="container-fluid about-background text-center">
		<div
			class="container border bg-light border-light rounded datepickercontainer"
			style="position: relative; top: 30%; font-size: 25px; width: 1000px; height: 130px; border-width: 3px !important; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.9);">
			<label for="date" id="checkinlabel"
				style="position: absolute; left: 90px;">Check-in</label> <label
				for="date" id="checkoutlabel"
				style="position: absolute; right: 290px;">Check-out</label><br>
			<div id="picker" class="mt-2">

				<span class="border border-secondary rounded" id="checkindate"
					style="box-sizing: border-box; padding: 5px; border-width: 3px !important;"></span>&nbsp;&nbsp;
				<br class="datebr" style="display: none;" />
				<br class="datebr" style="display: none;" />
				<span class="border border-secondary rounded" id="checkoutdate"
					style="box-sizing: border-box; padding: 5px; border-width: 3px !important;"></span>
				<!--                    &nbsp;&nbsp;<i class="fa fa-caret-down"></i>-->
			</div>
		</div>
	</div>

	<!--add rooms deck-->

	<div class="container mt-5" id="bookingmenu" style="max-width: 1300px;">
		<div class="row">
			<div class="col-md-7 col-lg-6 col-xl-8 col-12" id="roomcolumn">
				<div class="card mb-3"
					style="box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);">

					<div class="card-body mr-0">

						<div class="row no-gutters">
							<div class="col-md-7">
								<img class="mt-4 mr-4 img-thumbnail"
									src="./img/Royal Suite.jpeg" alt="Royal Suite"
									oncontextmenu="return false;"
									style="float: left; overflow-x: hidden;">
							</div>
							<div class="col-md-5 mt-5">
								<h5 class="p-2 rounded d-inline card-title" id='rooms1'
									style="margin-left:2.5rem; background: gray;">Royal Suite</h5>
								<p class="card-text">
								<ul style="list-style: none">
									<li>King Sized Beds</li>

									<br>
									<%
									// roomscat = rcd.GetRoomsPrice(1);
									%>
									<li>Price/Adult: <span class="final_price RSprice"><i
											class="fa fa-inr" aria-hidden="true"></i><strong
											class="price"><%=list.get(0).getPrice_person()%></strong></span></li>
									<li>Price/Child: <span class="final_price RSprice"><i
											class="fa fa-inr" aria-hidden="true"></i><strong
											class="price"><%=list.get(0).getPrice_child()%></strong></span> <br>
									<span style="font-size: 15px;"><strong>&nbsp;PerRoom/Night</strong></span><br>
									<span class="text-muted" style="font-size: 10px;">
											*Excluding GST</span><br>
									<span class="text-muted" style="font-size: 10px;">
											*Extra charges may apply</span></li>
								</ul>
								</p>
							</div>
						</div>
						<div class="container text-center mt-5">
							<p class="card-text">
								<a href="#" class="btn btn-light border-danger" id='addrooms1'
									data-toggle="modal" data-target="#RoomsModalCenter"><small>Add
										Rooms</small></a>
							</p>
						</div>
					</div>
				</div>

				<div class="card mb-3"
					style="box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);">

					<div class="card-body mr-0">
					<div class="row no-gutters">
							<div class="col-md-7">
							<img class="mt-4 mr-4 img-thumbnail"
								src="./img/Executive Suite.jpeg" alt="Executive Suite"
								oncontextmenu="return false;"
								style="float: left; overflow-x: hidden;">
								</div>
								<div class="col-md-5 mt-5">
						<h5 class="p-2 rounded d-inline card-title" id='rooms2'
							style="margin-left: 2.5rem ; background: gray;">Executive Suite</h5>
						<p class="card-text">
						<ul style="list-style: none">
							<li>King Sized Beds</li>

							<br>
							<%
							// roomscat = rcd.GetRoomsPrice(1);
							%>
							<li>Price/Adult: <span class="final_price ESprice"><i
									class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%=list.get(1).getPrice_person()%></strong></span></li>
							<li>Price/Child: <span class="final_price ESprice"><i
									class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%=list.get(1).getPrice_child()%></strong></span>
								<br>
							<span style="font-size: 15px;"><strong>&nbsp;PerRoom/Night</strong></span><br>
							<span class="text-muted" style="font-size: 10px;">
									*Excluding GST</span><br>
							<span class="text-muted" style="font-size: 10px;"> *Extra
									charges may apply</span></li>
						</ul>
						</p>
						</div>
						</div>
						<div class="container text-center mt-5">
							<p class="card-text">
								<a href="#" class="btn btn-light border-danger" id='addrooms2'
									data-toggle="modal" data-target="#RoomsModalCenter"><small>Add
										Rooms</small></a>
							</p>
						</div>
					</div>
				</div>

				<div class="card mb-3"
					style="box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);">
	
					<div class="card-body mr-0">
					<div class="row no-gutters">
							<div class="col-md-7">
							<img class="mt-4 mr-4 img-thumbnail" src="./img/Deluxe Room.jpeg"
								alt="Deluxe Room" oncontextmenu="return false;"
								style="float: left; overflow-x: hidden;">
								</div>
								<div class="col-md-5 mt-5">
						<h5 class="p-2 rounded d-inline card-title" id='rooms3'
							style="margin-left: 2.5rem ; background: gray;">Deluxe Room</h5>
						<p class="card-text">
						<ul style="list-style: none">
							<li>King Sized Beds</li>

							<br>
							<%
							// roomscat = rcd.GetRoomsPrice(1);
							%>
							<li>Price/Adult: <span class="final_price DRprice"><i
									class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%=list.get(2).getPrice_person()%></strong></span></li>
							<li>Price/Child: <span class="final_price DRprice"><i
									class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%=list.get(2).getPrice_child()%></strong></span>
								<br>
							<span style="font-size: 15px;"><strong>&nbsp;PerRoom/Night</strong></span><br>
							<span class="text-muted" style="font-size: 10px;">
									*Excluding GST</span><br>
							<span class="text-muted" style="font-size: 10px;"> *Extra
									charges may apply</span></li>
						</ul>
						</p>
						</div>
						</div>
						<div class="container text-center mt-5">
							<p class="card-text">
								<a href="#" class="btn btn-light border-danger" id='addrooms3'
									data-toggle="modal" data-target="#RoomsModalCenter"><small>Add
										Rooms</small></a>
							</p>
						</div>
					</div>
				</div>

				<div class="card mb-3"
					style="box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);">

					<div class="card-body mr-0">
					<div class="row no-gutters">
							<div class="col-md-7">
							<img class="mt-4 mr-4 img-thumbnail"
								src="./img/Standard Room.jpeg" alt="Standard Room"
								oncontextmenu="return false;"
								style="float: left; overflow-x: hidden;">
								</div>
								<div class="col-md-5 mt-5">
						<h5 class="p-2 rounded d-inline card-title" id='rooms4'
							style="margin-left: 2.5rem; background: gray;">Standard Room</h5>
						<p class="card-text">
						<ul style="list-style: none">
							<li>King Sized Beds</li>

							<br>
							<%
							// roomscat = rcd.GetRoomsPrice(1);
							%>
							<li>Price/Adult: <span class="final_price SRprice"><i
									class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%=list.get(3).getPrice_person()%></strong></span></li>
							<li>Price/Child: <span class="final_price SRprice"><i
									class="fa fa-inr" aria-hidden="true"></i><strong class="price"><%=list.get(3).getPrice_child()%></strong></span>
								<br>
							<span style="font-size: 15px;"><strong>&nbsp;PerRoom/Night</strong></span><br>
							<span class="text-muted" style="font-size: 10px;">
									*Excluding GST</span><br>
							<span class="text-muted" style="font-size: 10px;"> *Extra
									charges may apply</span></li>
						</ul>
						</p>
						</div>
						</div>
						<div class="container text-center mt-5">
							<p class="card-text">
								<a href="#" class="btn btn-light border-danger" id='addrooms4'
									data-toggle="modal" data-target="#RoomsModalCenter"><small>Add
										Rooms</small></a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-5 col-lg-6 col-xl-4 col-12" id="formcolumn"
				style="display: none;">
				<div class="card"
					style="box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);">

					<div class="card-body" style="position: relative;">
						<form class="readablecontent" action="BookingData" method="POST">
							<div class="container m-0 text-left">
								<!--style="display: none;"-->
								<div>
									<div
										style="position: absolute; left: 7%; display: inline-block; float: left;">
										<strong class="mb-2" style="display: inline-block;">Check-In:&nbsp;</strong><br>
										<span id="formcheckin"></span>
									</div>

									<div class="bg-danger p-2 text-center rounded-circle"
										style="position: absolute; top: 1%; left: 39%; width: 78px; height: 78px; box-sizing: border-box !important; display: inline-block;">
										<span class="mt-2 " id="formnight" style="font-weight: bold;"></span><br>
										<strong class="mb-2 " style="display: inline-block;">Night(s)</strong><br>
									</div>

									<div
										style="position: absolute; right: 7%; display: inline-block; float: right;">
										<strong class="mb-2" style="display: inline-block;">Check-out:&nbsp;</strong><br>
										<span id="formcheckout"></span><br>
										<br>
									</div>
								</div>
								<div class="form-group">
									<strong class="mb-2"
										style="margin-top: 100px; display: inline-block;">ROOM
										DETAILS</strong>
									<div class="border p-4 mb-3" id='roomcontent'
										style="border-color: crimson !important; border-width: 10px; border-radius: 25px;">
										<input type="text" name='roomname' class="form-control"
											id="roomname" onfocus="this.blur()" readonly> <label
											for="roomsadded">Rooms:&nbsp;</label> <input type="number"
											name='roomsbooked' class="form-control" id="roomsadded"
											onfocus="this.blur()" readonly> <label
											for="adultsadded">Adults:&nbsp;</label> <input type="number"
											name='noofadults' class="form-control" id="adultsadded"
											onfocus="this.blur()" readonly> <label
											for="kidsadded">Kids:&nbsp;</label> <input type="number"
											name='noofkids' class="form-control" id="kidsadded"
											onfocus="this.blur()" readonly>
									</div>
									<div id='hidebreakup'>Hide Breakup</div>
									<div class="border p-4 mt-3 mb-3" id='pricegstcontent'
										style="border-color: crimson !important; border-width: 10px; border-radius: 25px;">

										<label for="totalpriceofabove">Total Price(<span
											class='currencyvalue'></span>):&nbsp;
										</label> <input type="number" class="form-control mb-2"
											name="totalroomprice" id="totalpriceofabove"
											onfocus="this.blur()" readonly> <label for="gst">GST(<span
											class='currencyvalue'></span>):&nbsp;
										</label> <input type="number" name="gst" class="form-control" id="gst"
											onfocus="this.blur()" readonly>

									</div>
									<div class="border p-4 mb-3" id='totalamountcontent'
										style="border-color: crimson !important; border-width: 10px; border-radius: 25px;">

										<label for="totalamount">Total Amount(<span
											class='currencyvalue'></span>):&nbsp;
										</label> <input type="number" name='totalamount' class="form-control"
											id="totalamount" onfocus="this.blur()" readonly>

									</div>
									<div id="currencycontent">

										<label for="currency">Currency:&nbsp;</label> <input
											type="text" name='currencyname' class="form-control"
											id="currency" onfocus="this.blur()" readonly> <label
											for="checkindateinput">CheckIn:&nbsp;</label> <input
											type="date" name='checkin' class="form-control"
											id="checkindateinput" onfocus="this.blur()" readonly>

										<label for="checkoutdateinput">CheckOut:&nbsp;</label> <input
											type="date" name='checkout' class="form-control"
											id="checkoutdateinput" onfocus="this.blur()" readonly>

									</div>
								</div>

							</div>

							<%
							if (guest == null) {
							%>
							<%@include file="Components/SingupForm.jsp"%>
							<%
							}
							%>

							<div class="row text-center mt-4">
								<!--                                        <div class="col">
                                                                                <button id='browseagain' onclick="ResetForm();" class="btn btn-danger">Browse Again</button>
                                                                            </div>-->
								<div class="col">
									<button type="submit" class="btn btn-danger">Continue</button>
								</div>
							</div>





						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Add Rooms-->
	<div class="modal fade" id="RoomsModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-danger">
					<h5 class="modal-title" id="RoomsModalLongTitle">
						<!--Modal Title-->
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<strong>Single Room Price for Adult and Child</strong><br>
					<br> PerAdult:&nbsp;<span id="roomadultprice"></span><br>
					<br> PerChild:&nbsp;<span id="roomkidprice"></span><br>
					<br> <strong>Occupancy</strong><br>
					<!--                        <div class="container" style="position: relative;">-->
					<form>
						<!--increase decrease value-->
						<div class="container">
							<label for='Roomnumber'>No. of Rooms:&nbsp;&nbsp;</label>
							<div class="value-button value-button1" id="decreaseroom"
								onclick="decreaseRoomValue()" value="Decrease Value">-</div>
							<input type="number" class="number" id="Roomnumber" value="1"
								min="1" disabled />
							<div class="value-button value-button1" id="increaseroom"
								onclick="increaseRoomValue()" value="Increase Value">+</div>
						</div>
						<br />
						<div id="adultkid">

							<div class='container'>
								<label for='Adultnumber'>No. of
									Adults:&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<!--increase decrease value-->
								<!--                            <form style="margin-left: 15px;" id='noofadults'>-->
								<div class='value-button value-button1' id='decreaseadult'
									onclick='decreaseAdultValue()' value='Decrease Value'>-</div>
								<input type='number' class='number' id='Adultnumber' value="1"
									min='1' disabled />
								<div class='value-button value-button1' id='increaseadult'
									onclick='increaseAdultValue()' value='Increase Value'>+</div>
							</div>
							<br />

							<!--increase decrease value-->
							<div class="container">
								<label for="Kidnumber">No. of
									Kids:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<div class="value-button value-button1" id="decreasekid"
									onclick="decreaseKidValue()" value="Decrease Value">-</div>
								<input type="number" class="number" id="Kidnumber" value="0"
									disabled />
								<div class="value-button value-button1" id="increasekid"
									onclick="increaseKidValue()" value="Increase Value">+</div>

							</div>

						</div>
					</form>

					<!--</div>-->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" onclick = "closeModal()" class="btn btn-danger" id="formdisplay">Save
						changes</button>
<!-- 					<a id="formdisplay" onclick = "closeModal()" class="btn btn-danger"  -->
<!-- 						href="#" role="button">Save Changes</a> -->
				</div>
			</div>
			
			<script>
				function closeModal()
				{
// 					$("#formcolumn").focus();

// 					 $("html, body").animate({
// 					    scrollTop: $("#formcolumn").offset().top
// 					  }, 2000) /* 2000 milliseconds*/
					  
					$("#RoomsModalCenter").modal('hide');
				
				}
			</script>
		</div>
	</div>

	<!--Modal for Login-->
	<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: darkgrey !important;">
					<h5 class="modal-title" id="LoginModalLabel">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<%
				Message m = (Message) session.getAttribute("Message");

				if (m == null) {
					m = new Message("Sign Up By Booking Your First Room in our Resort!!", "info", "alert-warning");
				}
				%>
				<div id="alertmessage"
					class="text-center alert <%=m.getCssClass()%> " role="alert">
					<%=m.getContent()%>
				</div>
				<%
				if (m.getType() != "info") {
				%>
				<script>
					$(document).ready(function() {
						$("#LoginModal").modal('show');
					});
					
				</script>

				<%
				session.removeAttribute("Message");
				}
				%>

				<div class="modal-body">
					<div class="container" id="forgotpasscontainerform"
						style="display: none;">
						<form class="mt-2" action="ForgotPasswordServlet" method="post">

							<div class="form-group">
								<label for="ResetGuestEmail">Enter You Email address</label> <input
									type="email" name="Resetguestemailid" class="form-control"
									id="ResetGuestEmail" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>

							<div class="form-group">
								<label for="InputNewPassword">Reset Password</label>
								<div class="input-group mb-3">
									<input type="password" name="newguestpassword"
										class="form-control" id="InputNewPassword"
										placeholder="New Password">

									<div class="input-group-append">
										<span class="input-group-text" onclick="password_show_hide();">
											<i class="fas fa-eye" id="show_eye3"></i> <i
											class="fas fa-eye-slash d-none" id="hide_eye3"></i>
										</span>
									</div>

								</div>
							</div>

							<div class="modal-footer mt-5">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<a href="#" class="btn btn-danger" onclick="BackToLoginForm();"
									role="button">Go Back</a>
								<button type="submit" onclick="BackToLoginForm();"
									class="btn btn-success">Reset Password</button>
							</div>
						</form>
					</div>
					<div class="container" id="logincontainerform">
						<!--<span><h6 class="text-center mb-4"></h6></span>-->
						<form class="mt-2" action="LoginServlet" method="post">
							<div class="form-group">
								<label for="InputGuestEmail">Email address</label> <input
									type="email" name="loginguestemailid" class="form-control"
									id="InputGuestEmail" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="InputGuestPassword1">Password</label>&nbsp;&nbsp;<a
									href="#" onclick="ResetPassword();"
									style="font-size: 12px !important;">Forgot Password?</a>
								<div class="input-group mb-3">
									<input type="password" name="loginguestpassword"
										class="form-control" id="InputGuestPassword1"
										placeholder="Password">

									<div class="input-group-append">
										<span class="input-group-text" onclick="password_show_hide();">
											<i class="fas fa-eye" id="show_eye"></i> <i
											class="fas fa-eye-slash d-none" id="hide_eye"></i>
										</span>
									</div>

								</div>
							</div>

							<div class="modal-footer mt-5">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-danger">Login</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@include file="Components/Footer.jsp"%>

	<%-- scripts --%>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script type="text/javascript"
		src="./Components/MyJavaScript/moment.min.js"></script>
	<script type="text/javascript"
		src="./Components/MyJavaScript/daterangepicker.js"></script>

	<script type="text/javascript"
		src="./Components/MyJavaScript/dropdown.js"></script>


	<script type="text/javascript"
		src="Components/MyJavaScript/BookingValueChanger.js"></script>
	<script type="text/javascript"
		src="Components/MyJavaScript/PasswordUnhider.js"></script>
	<script type="text/javascript"
		src="Components/MyJavaScript/ResetFormJS.js"></script>

	<script>
		var nightdiff = 1;
		var start = null;
		var end = null;
		$(function() {
			$('#picker')
					.daterangepicker(
							{
								opens : 'center',
								startDate : moment(),
								endDate : moment().add(1, 'days'),
								minYear : parseInt(moment().format('YYYY'), 10),
								minDate : moment(),
								maxYear : parseInt(moment().add(2, 'year')
										.format('YYYY'), 10),
							},
							function(start, end) {
								$('#checkindate')
										.html(
												start.format('MMM DD YYYY')
														+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-calendar-alt" aria-hidden="true" style="color: grey;" ></i>');
								$('#formcheckin').html(
										start.format('MMM DD YYYY'));
								$('#formcheckout').html(
										end.format('MMM DD YYYY'));
								$('#checkindateinput').val(
										start.format('YYYY-MM-DD'));
								$('#checkoutdateinput').val(
										end.format('YYYY-MM-DD'));
								nightdiff = end.diff(start, 'days');
								if (nightdiff === 0) {
									$('#formnight').html("1");
								} else {

									$('#formnight').html(nightdiff);
								}
								$('#checkoutdate')
										.html(
												end.format('MMM DD YYYY')
														+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-calendar-alt" aria-hidden="true" style="color: grey;" ></i>');
							});
			$('#formcheckin').html(moment().format('MMM DD YYYY'));
			$('#formcheckout').html(
					moment().add(1, 'days').format('MMM DD  YYYY'));
			$('#checkindateinput').val(moment().format('YYYY-MM-DD'));
			$('#checkoutdateinput').val(
					moment().add(1, 'days').format('YYYY-MM-DD'));
			//                                            console.log(moment().format('DD-MM-YYYY'));

			start = moment().format('YYYY-MM-DD');
			end = moment().add(1, 'days').format('YYYY-MM-DD');

			var nightdiffdefault = moment().add(1, 'day')
					.diff(moment(), 'days');
			//                                            console.log(moment().add(1, 'day').diff(moment(), 'days'));
			$('#formnight').html(nightdiffdefault);
			$('#checkindate')
					.html(
							moment().format('MMM DD YYYY')
									+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-calendar-alt" aria-hidden="true" style="color: grey;" ></i>');
			$('#checkoutdate')
					.html(
							moment().add(1, 'days').format('MMM DD  YYYY')
									+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-calendar-alt" aria-hidden="true" style="color: grey;" ></i>');
		});
	</script>
	<script>
		$(document).ready(function() {
			var finaladultprice = null;
			var finalkidprice = null;
			$("#addrooms1").click(function() {
				var category = $('#rooms1').text();
				var adultprice = $('.RSprice').eq(0).html();
				var childprice = $('.RSprice').eq(1).html();
				$('#RoomsModalLongTitle').text(category);
				$('#roomadultprice').html(adultprice);
				$('#roomkidprice').html(childprice);
				//                    price logic
				var finaladultprice = $('.price').eq(0).html();
				//                    console.log('test1:', finaladultprice);
				var finalkidprice = $('.price').eq(1).html();
				//                    console.log('test2:', finalkidprice);
			});
			$("#addrooms2").click(function() {
				var category = $('#rooms2').text();
				var adultprice = $('.ESprice').eq(0).html();
				var childprice = $('.ESprice').eq(1).html();
				$('#RoomsModalLongTitle').text(category);
				$('#roomadultprice').html(adultprice);
				$('#roomkidprice').html(childprice);
				//                    price logic
				var finaladultprice = $('.price').eq(2).html();
				//                    console.log('test1:', finaladultprice);
				var finalkidprice = $('.price').eq(3).html();
				//                    console.log('test2:', finalkidprice);
			});
			$("#addrooms3").click(function() {
				var category = $('#rooms3').text();
				var adultprice = $('.DRprice').eq(0).html();
				var childprice = $('.DRprice').eq(1).html();
				$('#RoomsModalLongTitle').text(category);
				$('#roomadultprice').html(adultprice);
				$('#roomkidprice').html(childprice);
				//  price logic
				var finaladultprice = $('.price').eq(4).html();
				//                    console.log('test1:', finaladultprice);
				var finalkidprice = $('.price').eq(5).html();
				//                    console.log('test2:', finalkidprice);
			});
			$("#addrooms4").click(function() {
				var category = $('#rooms4').text();
				var adultprice = $('.SRprice').eq(0).html();
				var childprice = $('.SRprice').eq(1).html();
				$('#RoomsModalLongTitle').text(category);
				$('#roomadultprice').html(adultprice);
				$('#roomkidprice').html(childprice);
				// price logic
				var finaladultprice = $('.price').eq(6).html();
				//                    console.log('test1:', finaladultprice);
				var finalkidprice = $('.price').eq(7).html();
				//                    console.log('test2:', finalkidprice);
			});
		});
	</script>

	<script type="text/javascript"
		src="./Components/MyJavaScript/currencyconverter.js"></script>

	<script type="text/javascript"
		src="./Components/MyJavaScript/formmenu.js"></script>

	<script>
		if ((
	<%=rcd.GetNoofRooms(rcd.GetRoomsCategory(1).getCategory())%>
		) <= 1) {
			$('#addrooms1').prop('disabled', true);
			$('#addrooms1').removeClass("btn-light");
			$('#addrooms1').addClass("btn-danger");
			$('#addrooms1').text("Not Available!");
		}
		if ((
	<%=rcd.GetNoofRooms(rcd.GetRoomsCategory(2).getCategory())%>
		) <= 1) {
			$('#addrooms2').prop('disabled', true);
			$('#addrooms2').removeClass("btn-light");
			$('#addrooms2').addClass("btn-danger");
			$('#addrooms2').text("Not Available!");
		}
		if ((
	<%=rcd.GetNoofRooms(rcd.GetRoomsCategory(3).getCategory())%>
		) <= 2) {
			$('#addrooms3').prop('disabled', true);
			$('#addrooms3').removeClass("btn-light");
			$('#addrooms3').addClass("btn-danger");
			$('#addrooms3').text("Not Available!");
		}
		if ((
	<%=rcd.GetNoofRooms(rcd.GetRoomsCategory(4).getCategory())%>
		) <= 2) {
			$('#addrooms4').prop('disabled', true);
			$('#addrooms4').removeClass("btn-light");
			$('#addrooms4').addClass("btn-danger");
			$('#addrooms4').text("Not Available!");
		}

		window
				.addEventListener(
						"pageshow",
						function(event) {
							var historyTraversal = event.persisted
									|| (typeof window.performance != "undefined" && window.performance.navigation.type === 2);
							if (historyTraversal) {
								// Handle page restore.
								window.location.reload();
							}
						});
	</script>
</body>
</html>
