json.base currency.upcase
json.rates rates do |rate|
  json.set! rate.to_iso_code.upcase, rate.rate
end
