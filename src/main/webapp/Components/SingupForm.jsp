<div class="container m-0 text-left"> <!--style="display: none;"-->
    <strong class="mb-2" style="display: inline-block;">GUEST DETAILS</strong>
    <div class="form-group">
        <label for="guestname">Guest Name</label>
        <input type="text" name='guestname' class="form-control" id="guestname" required placeholder="Name">
    </div>
    <div class="form-group">
        <label for="emailaddress">Email address</label>
        <input type="email" name='guestemailid' class="form-control" id="emailaddress" required placeholder="EmailID">
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <div class="input-group mb-3">
            <input type="password" name='guestpassword' class="form-control" id="password" required placeholder="Password">
            <div class="input-group-append">
                <span class="input-group-text" onclick="password_show_hide();">
                    <i class="fas fa-eye" id="show_eye2"></i>
                    <i class="fas fa-eye-slash d-none" id="hide_eye2"></i>
                </span>
            </div>

        </div>
    </div>
    <div class="form-group">
        <label for="mobileno">Mobile Number</label>
        <input type="text" pattern="^\d{10}$" name='guestmobno' class="form-control" id="mobileno" oninvalid="this.setCustomValidity('Please Enter a valid Mobile Number')" oninput="setCustomValidity('')" required placeholder="Mobile Number">
    </div>

</div>