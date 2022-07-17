<li id = 'usernav' class="nav-item dropdown">
    <a
        class="nav-link dropdown-toggle"
        href="#"
        id="navbarDropdown"
        role="button"
        data-toggle="dropdown"
        aria-haspopup="true"
        aria-expanded="false"
        > <span id = "username"></span>
    </a>
    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <a class="dropdown-item" id="myaccount" href="guest.jsp"> My Account</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" id="logout" onclick="Logoutnavbtn()" href="LogoutServlet"><i class="fa fa-sign-in-alt" aria-hidden="true"></i> Logout</a>
    </div>
</li>

<script>
    function Logoutnavbtn(){
        $('#loginbuttonnav').show();
        $('#usernav').hide();
    }
</script>