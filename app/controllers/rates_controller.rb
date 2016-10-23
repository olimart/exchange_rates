class RatesController < ApiController

  def show
    if Rate::SUPPORTED_CURRENCIES.include?(params[:id])
      @currency = params[:id]
      if stale?(@rates)
        @rates = Rate.by_currency(@currency)
      end
    else
      render json: "Currency not supported", status: 406
    end
  end

end
