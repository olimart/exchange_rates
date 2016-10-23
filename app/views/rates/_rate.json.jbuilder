json.base currency.upcase
json.date rates.any? ? rates.first.date.to_date : Date.today
json.rates rates do |rate|
  json.set! rate.to_iso_code.upcase, rate.rate
end
