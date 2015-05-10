require "./Currency.rb"
require "./CustomErrorHandling.rb"

class CurrencyConverter
  attr_accessor :rates

  def initialize(rates)
    @rates = rates
  end

  def convert(currency, code)
    code = code.upcase
    if @rates.include?(code) == false
      raise UnknownCurrencyCodeError
    end
    if currency.code == code
      return currency == currency
    else
      converted = currency * (@rates[code] / @rates[currency.code])
      return Currency.new(converted.amount, code)
    end
  end
end
