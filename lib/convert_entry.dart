import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'currencybox.dart';
import 'currency_widget.dart';
import 'custom_icons.dart';


// the enums are important to track which currency Button is clicked
enum CurrencyFrom {
  euro,
  baht,
  dollar,
}

enum CurrencyTo {
  euro,
  baht,
  dollar,
}

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({Key? key}) : super(key: key);

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {

  // Instance variables
  CurrencyFrom? currencyFrom; //From which currency the user want to calculate
  CurrencyTo? currencyTo;  //To which currency the user want to calculate
  String calcValue = ''; //the final value ist saved in this attribute, this attribute is printed in final
  String printCurrency = '';  //shows the currency behind the calculated value

  final _textcontroller = TextEditingController();  //is needed to get the information from the textfield

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: kBarColor,
        title: const Text('SUPER CONVERTER'),
        centerTitle: true,
        leading:
        Icon(Icons.currency_exchange),
        actions: [
          Icon(Icons.settings)
        ],

      ),


      // structure of the overall project -> Column
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          //SizedBox are used to create the wished space between the widgets
          const SizedBox(
            height: 20,
          ),

          // first Text on Main Page
          const Text('Enter the amount to change:',
            style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: kBarColor

          ),
          ),


                 Padding(
                  padding: const EdgeInsets.all(12.0),
                    //input Field which should be calculated
                     child: TextField(
                      controller: _textcontroller, //nececassry to get the value of the text field
                      keyboardType: TextInputType.number, //only numbers can be entered
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.attach_money), //just for style at begin
                        hintText: 'Your amount',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.white)
                          ),
                      suffixIcon: IconButton( // to clear the entered number
                        onPressed: (){
                          _textcontroller.clear();
                          print('cleared');
                        },
                        icon: const Icon(Icons.clear),
                      ),
                        //Style of Textfield when editing
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1
                          ),
                        ),
                      ),

                      style: const TextStyle(
                          color: kText,
                          height: 1,
                          fontWeight: FontWeight.w800,
                          fontSize: 32

                      ),
                    ),
                  ),



                const SizedBox(
                 height: 5,
                 ),

                // FROM
                const Text('from',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: kBarColor),),

                 const SizedBox(
                  height: 5,
                ),


                 // Curreny Row from
                // the Currency entered in the textfield should be defined by clicking one of the three
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CurrencyBox(
                        theColor:
                            //color depending on which currency is clicked
                        currencyFrom == CurrencyFrom.euro
                            ? kExtra2Color //this when button clicked
                            : kExtra3Color, // when button is NOT clicked

                      //class which defines Size and Icon
                        theChild: CurrencyWidget(
                          currency: Custom.euro,
                          iconSize: 60,
                        ),
                    //function changes the variable currencyFrom to the one clicked
                    theOnTapFunc: (){
                          setState(() {
                            currencyFrom = CurrencyFrom.euro;
                          });
                    },
                    ),

                    //Same description for the following ones
                    CurrencyBox(
                      theColor:
                      currencyFrom == CurrencyFrom.baht
                          ? kExtra2Color
                          : kExtra3Color,
                      theChild: CurrencyWidget(
                        currency: Custom.bitcoin,
                        iconSize: 60,
                      ),
                      theOnTapFunc: (){
                        setState(() {
                          currencyFrom = CurrencyFrom.baht;
                        });
                      },
                    ),
                    CurrencyBox(
                      theColor:
                      currencyFrom == CurrencyFrom.dollar
                          ? kExtra2Color
                          : kExtra3Color,
                      theChild: CurrencyWidget(
                        currency: Custom.dollar,
                        iconSize: 60,
                      ),
                      theOnTapFunc: (){
                        setState(() {
                          currencyFrom = CurrencyFrom.dollar;
                        });
                      },
                    ),
                  ],
                ),

          const SizedBox(
            height: 5,
          ),


          // Text TO
          const Text('to',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: kBarColor),),

          const SizedBox(
            height: 5,
          ),


          // Same as other Row but for the currency in which the user want to calculate

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CurrencyBox(
                theColor:
                currencyTo == CurrencyTo.euro
                    ? kExtra2Color
                    : kExtra3Color,
                theChild: CurrencyWidget(
                  currency: Custom.euro,
                  iconSize: 60,
                ),
                theOnTapFunc: (){
                  setState(() {
                    currencyTo = CurrencyTo.euro;
                  });
                },
              ),
              CurrencyBox(
                theColor:
                currencyTo == CurrencyTo.baht
                    ? kExtra2Color
                    : kExtra3Color,
                theChild: CurrencyWidget(
                  currency: Custom.bitcoin,
                  iconSize: 60,
                ),
                theOnTapFunc: (){
                  setState(() {
                    currencyTo = CurrencyTo.baht;
                  });
                },
              ),
              CurrencyBox(
                theColor:
                currencyTo == CurrencyTo.dollar
                    ? kExtra2Color
                    : kExtra3Color,
                theChild: CurrencyWidget(
                  currency: Custom.dollar,
                  iconSize: 60,
                ),
                theOnTapFunc: (){
                  setState(() {
                    currencyTo = CurrencyTo.dollar;
                  });
                },
              ),
            ],
          ),


          const SizedBox(
            height: 20,
          ),


          // Own the big logic part of the App
          MaterialButton(onPressed: (){
            setState(() {
              double amount = double.parse(_textcontroller.text);  // the input of the textfield is converted to int
                                                                    // so we can calculate with it

              //We have 9 possible Combos of the two currencys which are handled like the following structure
              //Case € -> €
             if(currencyFrom == CurrencyFrom.dollar &&   // first 2 rows check the chosen currencys
                 currencyTo == CurrencyTo.dollar)  {
               calcValue = _textcontroller.text; // because the currencys are the same=> input = output
               printCurrency = '\$'; // prints the aimed currency behind
             }
             //Case B -> B
            else if(currencyFrom == CurrencyFrom.baht && //same as above
                 currencyTo == CurrencyTo.baht)  {
               calcValue = _textcontroller.text;
               printCurrency = 'B';
             }
             //Case $ -> $
             else if(currencyFrom == CurrencyFrom.euro && // same as above
                 currencyTo == CurrencyTo.euro)  {
               calcValue = _textcontroller.text;
               printCurrency = '€';
             }
             //Case € -> B
             else if(currencyFrom == CurrencyFrom.euro &&
                 currencyTo == CurrencyTo.baht){
               amount = amount * 36.5;                     // amount is multiplied with the € ratio
               calcValue = amount.toStringAsFixed(2);     // calculated value is converted to String and saved in calcValue to print it later
               printCurrency = 'B';
             }
             //Case € -> $
             else if(currencyFrom == CurrencyFrom.euro &&
                 currencyTo == CurrencyTo.dollar){           // SIMILAR TO THE FOLLOWING AS ABOVE
               amount = amount * 1.08;
               calcValue = amount.toStringAsFixed(2);
               printCurrency = '\$';
             }
             //Case $ -> B
             else if(currencyFrom == CurrencyFrom.dollar &&
                 currencyTo == CurrencyTo.baht){
               amount = amount * 34.37;
               calcValue = amount.toStringAsFixed(2);
               printCurrency = 'B';
             }
             //Case $ -> €
             else if(currencyFrom == CurrencyFrom.dollar &&
                 currencyTo == CurrencyTo.euro){
               amount = amount * 0.94;
               calcValue = amount.toStringAsFixed(2);
               printCurrency = '€';
             }
             //Case B -> €
             else if(currencyFrom == CurrencyFrom.baht &&
                 currencyTo == CurrencyTo.euro){
               amount = amount * 0.027;
               calcValue = amount.toStringAsFixed(2);
               printCurrency = '€';
             }
             //Case B -> $
             else if(currencyFrom == CurrencyFrom.baht &&
                 currencyTo == CurrencyTo.dollar){
               amount = amount * 0.029;
               calcValue = amount.toStringAsFixed(2);
               printCurrency = '\$';
             }

            });
          },
            color: kBarColor,
            height: 66,
            minWidth: 200,

            child: const Text('Calculate', style: TextStyle(
              fontSize: 36
            )),
          ),

          Expanded(

            //Output Container
              child: Container(

                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: kExtra1Color,
                  border: Border.all(color: kInput, width: 4),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Center(
                  child: FittedBox(  // so that the printed result adapts to the width of the box
                    fit: BoxFit.fitWidth,
                    // Main result printed :
                    child: Text( calcValue + ' ' + printCurrency  , style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'NotoSerifTamil',

                    ),
                    ),
                  ),
                ),
              ),
          ),
        ],
      ),

    );
  }
}