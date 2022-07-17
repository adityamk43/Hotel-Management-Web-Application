/* global start, end */

let text = '<i class="fa fa-inr" aria-hidden="true"></i> INR';
document.getElementById("currency-name").innerHTML = text;
//booking page
$('.currencyvalue').text('INR');
$('#currency').val('INR');

function currencychange(clicked_id) {
    currencyname = clicked_id;
//  console.log(
//    "currency: ",
//    '<i class="fa fa-' +
//      currencyname.toLowerCase().trim() +
//      '" aria-hidden="true"></i>' +
//      currencyname
//  );

    document.getElementById("currency-name").innerHTML =
            '<i class="fa fa-' +
            currencyname.toLowerCase().trim() +
            '" aria-hidden="true"></i> ' +
            currencyname;
}

function BookingLogic() {
    $('#formcolumn').css("display", "none");
    $('.readablecontent').trigger("reset");


    $('#checkindateinput').val(start);
    $('#checkoutdateinput').val(end);

//    booking page
    $('.currencyvalue').text(currencyname);
    $('#currency').val(currencyname);
}