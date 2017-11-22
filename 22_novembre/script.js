

//How it works :

// 1/ the calculator receives inputs from the buttons with .click() listeners.

// 2/When it gets a click, it will add that digit to the end of the number var,
// var will be a string while it is receiving input.

// 3/when the user clicks an operator, the operator var will be set to the operator clicked,
// The first inputted number will be saved into a new var newnumber, while setting number to "" (an empty string).

// When "=" is clicked, it takes the number, the newnumber, and the operator, and performs the operation.

//testNumLength function constrols the length so that the content in the div doesn't overflow.
$(function() {
//    var testNumLength = function(number) {
//        if (number.length > 9) {
//            totaldiv.text(number.substr(number.length-9,9));
//            if (number.length > 15) {
//                number = "";
//                totaldiv.text("too big");
//            }
//        }
//    };
    var number = "";                        //declare number as empty strings
    var newnumber = "";                     //declare newnumber as empty strings
    var operator = "";                      //declare operator as empty strings
    var totaldiv = $("#total");             //totaldiv variable to change the text of the $("#total")
    totaldiv.text("0");                     //set the .text() of totaldiv to "0"

    //HOW IT WORKS : .click() listener to the #numbers a
    //takes the .text() of the button, append that to number,
    //set the .text() of totaldiv to number,
    //call testNumLength, passing in number as the parameter.


    //$(".numbers").not("#clear,#clearall").click(function(){       //exclude #clear #clearall
    //$(".number img").attr('alt')
       $('.numbers a img').click(function(){
        number += $(this).attr('alt');                                   //takes the .html() of the number button and assigns it to var number
        totaldiv.text(number);                                      //Sets the .text() of totaldiv to number.
        testNumLength(number);                                      //test length
    });


    //Take the .text() of the button, and set the operator variable to that.

    $(".operators a img").click(function(){              //click() to handle all of the #operators except for #equals button
        operator = $(this).attr('alt');                                  //html of the button
        newnumber = number;                                         //set the value of newnumber to number
        number = "";                                                //set number to ""
        totaldiv.text(operator);                                    //set the operator text
    });
    $("#clear,#clearall").click(function(){                         //reinitialise number #total
        number = "";
        totaldiv.text("0");
        if ($(this).attr("id") === "clearall") {
            newnumber = "";
        }
    });

    $("#equals").click(function(){
        if (operator === "+"){
			number = (parseInt(number) + parseInt(newnumber)).toString(); //Number.parseInt() converts to integer; base 10 - optionnal
        } else if (operator === "-"){
            number = (parseInt(newnumber, 10) - parseInt(number,10)).toString(10);
        } else if (operator === "/"){
            number = (parseInt(newnumber, 10) / parseInt(number,10)).toString(10);
        } else if (operator === "*"){
            number = (parseInt(newnumber, 10) * parseInt(number,10)).toString(10);
        }
        totaldiv.text(number);
        //testNumLength(number);
        //number = "";
        //newnumber = "";
        number += $totaldiv.text(number)
        newnumber = "";
    });
});
