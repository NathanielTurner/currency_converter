class CustomErrorHandling < StandardError

rescue DifferentCurrencyCodeError
  puts "You cannot subtract two currencies with different currency codes."
end

rescue UnknownCurrencyCodeError
  puts "The currency code given is unknown to me."
end

end
