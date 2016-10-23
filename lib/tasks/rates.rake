namespace :rates do

  desc 'Load sample data from db/sample_data.rb'
  task update_from_open_exchange_rates: :environment do
    fx = OpenExchangeRates::Rates.new
    supported_currencies = Rate::SUPPORTED_CURRENCIES
    supported_currencies.each do |currency|
      currencies = supported_currencies - [currency]
      currencies.each do |curr|
        rate = fx.exchange_rate(from: currency.upcase, to: curr.upcase)
        Rate.create_with(rate: rate, date: Time.now).
          find_or_create_by!(from_iso_code: currency, to_iso_code: curr)
      end
    end
  end

end
