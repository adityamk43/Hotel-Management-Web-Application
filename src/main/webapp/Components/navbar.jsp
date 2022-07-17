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
<!--                 <a class="nav-link" href="Contact.jsp"> <i class="fa fa-phone-square fa-rotate-90" aria-hidden="true"></i> Contact Us</a> -->
                <a class="nav-link" href="Contact.jsp"> <i class="fa fa-phone-square" aria-hidden="true"></i> Contact Us</a>
            </li>
            <li class="nav-item dropdown">
                <a
                    class="nav-link dropdown-toggle currency-name"
                    href="#"
                    id="navbarDropdown"
                    role="button"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                    > <span id="currency-name"><%--Currency --%></span>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item currency-type" id="INR" onclick = "currencychange(this.id); getResults(); getCurrencyId(this.id);" href="#"> <i class="fa fa-inr" aria-hidden="true"></i> INR</a>
                    <a class="dropdown-item currency-type" id="USD" onclick = "currencychange(this.id); getResults(); getCurrencyId(this.id);" href="#"> <i class="fa fa-usd" aria-hidden="true"></i> USD</a>
                    <!--                    <div class="dropdown-divider"></div>-->
                    <a class="dropdown-item currency-type" id="EUR" onclick = "currencychange(this.id); getResults(); getCurrencyId(this.id);" href="#"> <i class="fa fa-eur" aria-hidden="true"></i> EUR</a>
                </div>
            </li>
        </ul>
        <ul class="navbar-nav mr-5">
            <li class="nav-item">
                <a class="nav-link" href="booking.jsp"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> Book Now</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="rooms.jsp"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> Rooms</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> Restaurant</a>
            </li>
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
