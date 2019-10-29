# frozen_string_literal: true

class RatesController < ApiController
  NOT_SUPPORTED = "Currency not supported"

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
      render json: NOT_SUPPORTED.to_json, status: :not_acceptable
    end
  end
end
