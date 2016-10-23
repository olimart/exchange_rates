class RatesController < ApiController

  def show
    @rates = Rate.by_currency(params[:id])

    if @rates.any?
      @currency = params[:id]
    else
      render json: "Currency not supported", status: 406
    end
  end

end
