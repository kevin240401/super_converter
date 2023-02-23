Super Converter 

The idea of this application was to solve the biggest problem visting students have in 
Thailand => The different currency!

Because of the exchange rate of about 35 to 37 it is hard to translate it to our 
home currency. 
When we were on Koh Tao we wanted to make a boat trip. The guy told us that it
would cost 1700 Baht per person. In our heads we calculated other amounts which were different 
up to 10 Euros. This problem needed to be solved with an easy application. 

As a result I wanted to make an mobile app which is easy to handle, fast 
to get the answers and very intuitive. I have decided to not have a fancy Homepage and stuff
like this because i wanted to give the user the possibility to solve his problem as fast as possible.
That ist why the application starts directly into the functionality.

The user just has to fill in the amount and tap the currencies he want to change from top
to the bottom. With the small instruction(-words) you get the system within 3 seconds.

As a small Addition to this is the Table which includes typical amounts of Money and their 
exchange rates to euro or baht.

With this application we could have told to the boat lender that the price was to much for us 
way faster. :)



About the implementation:

Generally we can see that this is a simple Column out of 8 components.
    - 3 times a Text
    - 1 Inputfield(only numbers)
    - 2 Rows to choose the 2 currencies
    - 1 Button to calculate the result
    - 1 Output field 

The main function is: 

The textcontroller gives me the value of the Input field.
With 2 variables and 2 enums I catch which currency button is currently clicked.
These components are all given to the logic of the button. 

The material button has got the whole logic of the functionality. It checks the 9 different 
possibilities that comes out of the 2 rows witch each 3 currencies. The amount is than converted
with a fixed rate to the wanted currency (currencyTo) and is printed by clicking the button.


