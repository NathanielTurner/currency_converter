require "./CustomErrorHandling.rb"

class Currency
  attr_accessor :amount, :code

  def initialize(amount, code = nil)
    if code != nil
      @amount = amount.to_f.round(2)
      @code = code.upcase
    else
      symbols = {"USD" => "$","EUR" => "€","GBP" => "£","CRC" => "₡",
      "KRW" => "₩","NGN" => "₦","JPY" => "¥"}
      amount.delete(' ')
      combo = amount.split('', 2)
      @amount = combo[1].to_f
      @code = symbols.key(combo[0])
    end
  end

  def == (another)
    if (@amount == another.amount) &&
       (@code == another.code)
       return Currency.new(another.amount, another.code)
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
    if (@code != another.code)
      raise DifferentCurrencyCodeError
    end
    return Currency.new(amount + another.amount, @code)
  end

  def -(another)
    if (@code != another.code)
      raise DifferentCurrencyCodeError
    end
    return Currency.new(@amount - another.amount, @code)
  end

  def *(number)
    return Currency.new(@amount * number, @code)
  end
end
