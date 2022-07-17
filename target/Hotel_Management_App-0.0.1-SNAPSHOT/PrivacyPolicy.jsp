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
                    <p>
                        This privacy policy sets out how we uses and protects any information that you give us when you use this website. we are committed to ensuring that your privacy is protected. Should we ask you to provide certain information by which you can be identified when using this website, and then you can be assured that it will only be used in accordance with this privacy statement. we may change this policy from time to time by updating this page. You should check this page from time to time to ensure that you are happy with any changes. 
                    <p>
                    <ul id="privacy">
                        <li><i class="fa fa-certificate" aria-hidden="true">What information do we collect?</i> </li>
                        We collect information from you when you place an order or respond to a survey. When ordering or registering on our site, as appropriate, you may be asked to enter your: name, e-mail address, mailing address or phone number or any other information. You may, however, browse our site anonymously.

                        <li><i class="fa fa-certificate" aria-hidden="true">
                                What do we use your information for?</i></li>
                        Any of the information we collect from you may be used in one of the following ways :

                        <li>To personalize your experience</li>
                        (your information helps us to better respond to your individual needs)
                        <li>To improve our website</li>
                        (we continually strive to improve our website offerings based on the information and feedback we receive from you)
                        <li>To improve customer service</li>
                        (your information helps us to more effectively respond to your customer service requests and support needs)

                        <li>Use of information & details given by you</li>
                        Your information, whether public or private, will not be sold, exchanged, transferred, or given to any other company for any reason whatsoever, without your consent, other than for the express purpose of delivering the purchased product or service requested.

                        <li><i class="fa fa-certificate" aria-hidden="true">
                                To administer a contest, promotion, survey or other site feature.</i> </li>
                        <li><i class="fa fa-certificate" aria-hidden="true">
                                To send periodic emails </i> </li>
                        <li><i class="fa fa-certificate" aria-hidden="true">
                                The email address you provide for order processing, will only be used to send you information and updates pertaining to your order</i> </li>


                        <li><i class="fa fa-certificate" aria-hidden="true">
                                How do we protect your information ?</a> </i> </li>
                        We implement a variety of security measures to maintain the safety of your personal information when you place an order or access your personal information. We offer the use of a secure server. All supplied sensitive/credit information is transmitted via Secure Socket Layer (SSL) technology and then encrypted into our Payment gateway providers database only to be accessible by those authorized with special access rights to such systems, and are required to keep the information confidential. After a transaction, your private information (credit cards, social security numbers, financials, etc.) will not be stored on our servers.


                        <li><i class="fa fa-certificate" aria-hidden="true">
                                Do we use cookies ? </i> </li>
                        We do not use cookies.
                        <li><i class="fa fa-certificate" aria-hidden="true">
                                Do we disclose any information to outside parties ? </i> </li>
                        We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not include trusted third parties who assist us in operating our website, conducting our business, or servicing you, so long as those parties agree to keep this information confidential. We may also release your information when we believe release is appropriate to comply with the law, enforce our site policies, or protect ours or others rights, property, or safety. However, non-personally identifiable visitor information may be provided to other parties for marketing, advertising, or other uses.
                        <li><i class="fa fa-certificate" aria-hidden="true">
                                Third party links </i> </li>
                        Occasionally, at our discretion, we may include or offer third party products or services on our website. These third party sites have separate and independent privacy policies. We therefore have no responsibility or liability for the content and activities of these linked sites. Nonetheless, we seek to protect the integrity of our site and welcome any feedback about these sites. 


                        <li><i class="fa fa-certificate" aria-hidden="true">
                                Online Privacy Policy Only</i> </li>
                        This online privacy policy applies only to information collected through our website and not to information collected offline.

                        <li><i class="fa fa-certificate" aria-hidden="true">
                                Terms and Conditions</i> </li>
                        Please also visit our <a href="Terms.jsp" style="text-decoration: none;">Terms and Conditions</a> section establishing the use, disclaimers, and limitations of liability governing the use of our website.
                        <li><i class="fa fa-certificate" aria-hidden="true">
                                Your Consent </i> </li>
                        By using our site, you consent to our privacy policy.

                        <li><i class="fa fa-certificate" aria-hidden="true">
                                Changes to our Privacy Policy </i> </li>
                        If we decide to change our privacy policy, we will post those changes on this page.
                        <li><i class="fa fa-certificate" aria-hidden="true">
                                Contacting Us</i> </li>
                        If there are any questions regarding this privacy policy you may contact us using the information below.<br><br>
                        www.AtithyamResort.in<br>
                        +91–7982177620
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
