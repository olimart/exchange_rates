class RatesController < ApiController

  def show
    if Rate::SUPPORTED_CURRENCIES.include?(params[:id])
      @currency = params[:id]
      if stale?(@rates)
        rates = Rate.by_currency(@currency)
        @rates = {}
        rates.each do |rate|
          @rates["#{rate.to_iso_code}".upcase] = rate.rate
        end
        @rates
        @date = rates.any? ? rates.first.date.to_date : Date.today
      end
    else
      render json: "Currency not supported", status: 406
    end
  end

end
