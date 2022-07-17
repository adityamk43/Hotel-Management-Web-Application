function password_show_hide() {
    var x1 = document.getElementById("InputGuestPassword1");
    var x2 = document.getElementById("password");
    var x3 = document.getElementById("InputNewPassword");
    var show_eye = document.getElementById("show_eye");
    var hide_eye = document.getElementById("hide_eye");
    
    var show_eye2 = document.getElementById("show_eye2");
    var hide_eye2 = document.getElementById("hide_eye2");
    
    var show_eye3 = document.getElementById("show_eye3");
    var hide_eye3 = document.getElementById("hide_eye3");
    
    hide_eye.classList.remove("d-none");
    hide_eye2.classList.remove("d-none");
    hide_eye3.classList.remove("d-none");
    
    if (x1.type === "password") {
        x1.type = "text";
        show_eye.style.display = "none";
        hide_eye.style.display = "block";
    } else {
        x1.type = "password";
        show_eye.style.display = "block";
        hide_eye.style.display = "none";
    }
    
    if (x2.type === "password") {
        x2.type = "text";
        show_eye2.style.display = "none";
        hide_eye2.style.display = "block";
    } else {
        x2.type = "password";
        show_eye2.style.display = "block";
        hide_eye2.style.display = "none";
    }
    
    if (x3.type === "password") {
        x3.type = "text";
        show_eye3.style.display = "none";
        hide_eye3.style.display = "block";
    } else {
        x3.type = "password";
        show_eye3.style.display = "block";
        hide_eye3.style.display = "none";
    }
}