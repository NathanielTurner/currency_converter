# Currency Converter

Currency Converter can take a hash of currency types and the rates that they convert to US dollars. It can use this as a base to convert currencies between all the rates within the hash.

## How It Works

There are two classes

* Currency
* CurrencyConverter

#### Currency

Currency is a blueprint for how currency objects will work.
It stores the currency amount and the type of currency. It defines methods for addition, subtraction, and multiplication of the currency object. It is initialized with a hash of currency symbols to currency three letter acronyms equivalent to the currency symbol. It uses this to recognize currency symbols and convert them to their respective acronyms for use as codes.

#### CurrencyConverter

CurrencyConverter is initialized with a hash. It has one method that takes a currency object and a currency code. If the code is equal to the currency objects code, it returns a new currency object with the same value and code. otherwise it will convert the amount in the currency object to one equivalent to the currency type given. It will return a new object with the converted value and the currency type requested it be converted to.

##Notes

* There is no current way to enter currencies
* Currencies it can accept are limited to the following list
: USD, EUR, JPY, GBP, CRC, KRW, NGN
