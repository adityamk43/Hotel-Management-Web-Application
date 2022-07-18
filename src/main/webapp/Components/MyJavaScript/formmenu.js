/* global nightdiff, DateRangePicker */
//function ResetForm()
//{
//    $('#formcolumn').hide();
//    $('.readablecontent').trigger("reset");
//}


$(document).ready(function () {
    var totalpriceofabove = 0;

    $("#formdisplay").click(function ()
    {
//        var mheight = 800;
        $("#formcolumn").css("display", "block");
//        $('#roomcolumn').removeClass('col-md-10');
//            $('#roomcolumn').addClass('col-md-8');
//        $("#roomcolumn").css("overflow-y", "scroll");
//        $("#roomcolumn").css("height", "100vh !important");
//        $('#roomcolumn').height(mheight);
//        $("#bookingmenu").css("width", "1500");


        $("#roomname").val($('#RoomsModalLongTitle').text().trim());

        $("#roomsadded").val($('#Roomnumber').val());
        console.log($('#roomsadded').val());
        $("#adultsadded").val($('#Adultnumber').val());
        $("#kidsadded").val($('#Kidnumber').val());

        var adultnumber = $('#Adultnumber').val();
        var kidnumber = $('#Kidnumber').val();
        var roomadultprice = $('#roomadultprice').text();
        var roomkidprice = $('#roomkidprice').text();
        var roomnumber = $('#Roomnumber').val();

        if (nightdiff === 0) {
            totalpriceofabove = (parseFloat(adultnumber * roomadultprice + kidnumber * roomkidprice) * roomnumber);
        } else {

            totalpriceofabove = ((parseFloat(adultnumber * roomadultprice + kidnumber * roomkidprice) * roomnumber) * nightdiff).toFixed(2);
        }


        $("#totalpriceofabove").val(totalpriceofabove);
        var GSTAmount = parseFloat((totalpriceofabove * (0.10)).toFixed(2));
        $('#gst').val(GSTAmount);
        var TotalAmount = (parseFloat(totalpriceofabove) + (GSTAmount)).toFixed(2);
        $('#totalamount').val(TotalAmount);

		//Moving to form section after the click happens especially done for mobile users		
		setTimeout(function() {
                   document.getElementById('formcolumn').scrollIntoView();
                }, 400);
			
	
    });
    $('#hidebreakup').click(function () {
        if ($('#hidebreakup').text() == "Hide Breakup") {


            $('#pricegstcontent').hide();
            $('#hidebreakup').text("View Breakup");

        } else {

            $('#pricegstcontent').show();
            $('#hidebreakup').text("Hide Breakup");
        }
    });

});

