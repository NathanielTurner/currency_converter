class Currency
  attr_accessor :amount, :code

  def initialize(amount, code = nil)
    if code != nil
      @amount = amount.to_f
      @code = code
    else
      symbols = {"usd" => "$","uer" => "€","gbp" => "£","crc" => "₡",
      "krw" => "₩","ngn" => "₦","jpy" => "¥"}
      amount.delete(' ')
      combo = amount.split('', 2)
      @amount = combo[1].to_f
      @code = symbols.key(combo[0])
    end
  end

  def ==(another)
    if (@amount == another.amount) &&
       (@code == another.code)
       return true
    else
      return false
    end
  end

  def !=(another)
    if (@amount != another.amount) ||
       (@code != another.code)
       return true
    else
      return false
    end
  end

  def +(another)
    if (@code == another.code)
      return Currency.new(amount + another.amount, @code)
    end
  end

  def -(another)
    if (@code == another.code)
      return Currency.new(@amount - another.amount, @code)
    end
  end

  def *(number)
    return Currency.new(@amount * number, @code)
  end
end
=begin
Currency objects:

Should be created with an amount
and a currency code

Should equal another Currency
object with the same amount and
currency code
def ==(other currency)
self.amount self.code

Should NOT equal another Currency
object with different amount or
currency code

Should be able to be added to
another Currency object with the
same currency code

Should be able to be subtracted
by another Currency object with
the same currency code

Should raise a
DifferentCurrencyCodeError when
you try to add or subtract two
Currency objects with different
currency codes.

Should be able to be multiplied
by a Fixnum or Float and return
a Currency object

Currency.new should be able to
take one argument with a currency
symbol embedded in it, like
"$1.20" or "€ 7.00", and figure
out the correct currency code.
It can also take two arguments
like before, one being the amount
and the other being the currency
code.
=end
