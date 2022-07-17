function increaseRoomValue() {
    var decrease = document.getElementById('decreaseroom');
    decrease.classList.remove('value-button2');
    decrease.classList.add('value-button1');

    var value = parseInt(document.getElementById('Roomnumber').value, 10);
    value = isNaN(value) ? 1 : value;
    
    if (value > 3)
    {
//                    document.getElementById('increase').style.pointerEvents = 'none';
        var increase = document.getElementById('increaseroom');
        increase.classList.remove('value-button1');
        increase.classList.add('value-button2');
    } else {
        value++;
        
        $('').append("");
    }
    document.getElementById('Roomnumber').value = value;
}

function decreaseRoomValue() {
    var value = parseInt(document.getElementById('Roomnumber').value, 10);
    value = isNaN(value) ? 1 : value;

//                value < 1 ? 1 : '';
    if (value < 2)
    {

//                    document.getElementById('increase').style.pointerEvents = 'none';
        var decrease = document.getElementById('decreaseroom');
        decrease.classList.remove('value-button1');
        decrease.classList.add('value-button2');
    } else {
        value--;
    }
    var increase = document.getElementById('increaseroom');
    increase.classList.remove('value-button2');
    increase.classList.add('value-button1');
//                document.getElementById('increase').style.pointerEvents = 'auto';


    document.getElementById('Roomnumber').value = value;
}

function increaseAdultValue() {
    var decrease = document.getElementById('decreaseadult');
    decrease.classList.remove('value-button2');
    decrease.classList.add('value-button1');

    var value = parseInt(document.getElementById('Adultnumber').value, 10);
    value = isNaN(value) ? 1 : value;
    if (value > 5)
    {
//                    document.getElementById('increase').style.pointerEvents = 'none';
        var increase = document.getElementById('increaseadult');
        increase.classList.remove('value-button1');
        increase.classList.add('value-button2');
    } else {
        value++;
    }
    document.getElementById('Adultnumber').value = value;
}

function decreaseAdultValue() {
    var value = parseInt(document.getElementById('Adultnumber').value, 10);
    value = isNaN(value) ? 1 : value;

//                value < 1 ? 1 : '';
    if (value < 2)
    {

//                    document.getElementById('increase').style.pointerEvents = 'none';
        var decrease = document.getElementById('decreaseadult');
        decrease.classList.remove('value-button1');
        decrease.classList.add('value-button2');
    } else {
        value--;
    }
    var increase = document.getElementById('increaseadult');
    increase.classList.remove('value-button2');
    increase.classList.add('value-button1');
//                document.getElementById('increase').style.pointerEvents = 'auto';


    document.getElementById('Adultnumber').value = value;
}

function increaseKidValue() {
    var decrease = document.getElementById('decreasekid');
    decrease.classList.remove('value-button2');
    decrease.classList.add('value-button1');

    var value = parseInt(document.getElementById('Kidnumber').value, 10);
    value = isNaN(value) ? 0 : value;
    if (value > 5)
    {
//                    document.getElementById('increase').style.pointerEvents = 'none';
        var increase = document.getElementById('increasekid');
        increase.classList.remove('value-button1');
        increase.classList.add('value-button2');
    } else {
        value++;
    }
    document.getElementById('Kidnumber').value = value;
}

function decreaseKidValue() {
    var value = parseInt(document.getElementById('Kidnumber').value, 10);
    value = isNaN(value) ? 0 : value;

//                value < 1 ? 1 : '';
    if (value < 1)
    {

//                    document.getElementById('increase').style.pointerEvents = 'none';
        var decrease = document.getElementById('decreasekid');
        decrease.classList.remove('value-button1');
        decrease.classList.add('value-button2');
    } else {
        value--;
    }
    var increase = document.getElementById('increasekid');
    increase.classList.remove('value-button2');
    increase.classList.add('value-button1');
//                document.getElementById('increase').style.pointerEvents = 'auto';


    document.getElementById('Kidnumber').value = value;
}