const api = "https://api.exchangerate-api.com/v4/latest/INR";

// for selecting different controls
// var price = document.getElementById("price").innerHTML;
var price = document.getElementsByClassName("price");

const PriceArr = new Array();

for (var i = 0; i < price.length; i++)
{
    PriceArr[i] = price[i].innerHTML;
//  console.log("price: ", PriceArr[i].innerHTML)
}

var fromCurrency = "INR";
var fromCurrencyforForm = "INR";

var toCurrency;
// var finalValue = document.querySelector(".finalValue");
var finalValueClass = document.getElementsByClassName("final_price");

function getCurrencyId(clicked_id)
{
    toCurrency = clicked_id;
}

function getResults() {
    fetch(`${api}`)
            .then((currency) => {
                return currency.json();
            })
            .then(displayResults);
}

// display results after convertion
function displayResults(currency) {

    var fromRate = currency.rates[fromCurrency];
//    var fromRate2 = currency.rates[fromCurrencyforForm];
    var toRate = currency.rates[toCurrency];

    for (var i = 0; i < finalValueClass.length; i++)
    {
//    finalValueClass[i].style.fontWeight = "bold";
        if ((toRate / fromRate) === 1) {
            finalValueClass[i].innerHTML = '<i class="fa fa-' + toCurrency.toLowerCase().trim() + '" aria-hidden="true"></i><strong class="price">' + ((toRate / fromRate) * PriceArr[i]).toFixed(0) + '</strong>';
        } else {
            finalValueClass[i].innerHTML = '<i class="fa fa-' + toCurrency.toLowerCase().trim() + '" aria-hidden="true"></i><strong class="price">' + ((toRate / fromRate) * PriceArr[i]).toFixed(2) + '</strong>';
        }
    }

//    var formtotalpriceextract = $("#totalpriceofabove").val();
//    var formgstextract = $("#gst").val();
//    var formtotalAmountextract = $("#totalamount").val();
//    var totalcurrencyvalueform = 0;
//    var totalgstvalueform = 0;
//    var totalAmountvalueform = 0;
//    $("#totalpriceofabove").val('');
//    if ((toRate / fromRate) === 1) {
//        totalcurrencyvalueform = ((toRate / fromRate2) * formtotalpriceextract).toFixed(0);
//        totalgstvalueform = ((toRate / fromRate2) * formgstextract).toFixed(0);
//        totalAmountvalueform = ((toRate / fromRate2) * formtotalAmountextract).toFixed(0);
//    } else {
//        totalcurrencyvalueform = ((toRate / fromRate2) * formtotalpriceextract).toFixed(2);
//        totalgstvalueform = ((toRate / fromRate2) * formgstextract).toFixed(2);
//        totalAmountvalueform = ((toRate / fromRate2) * formtotalAmountextract).toFixed(2);
//    }
//    $("#totalpriceofabove").val(totalcurrencyvalueform);
//    $("#gst").val(totalgstvalueform);
//    $("#totalamount").val(totalAmountvalueform);
//
//    fromCurrencyforForm = $('#currency-name').text().toUpperCase().trim();

}
