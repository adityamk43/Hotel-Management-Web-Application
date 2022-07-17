function ResetPassword(){
    
    $('#logincontainerform').hide();
    $('#forgotpasscontainerform').show();
    $('#alertmessage').hide();
    
}

function BackToLoginForm(){
    $('#logincontainerform').show();
    $('#forgotpasscontainerform').hide();
    $('#alertmessage').show();
}