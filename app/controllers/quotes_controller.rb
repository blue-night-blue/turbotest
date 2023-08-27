class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]

  def index
    @quotes = Quote.ordered
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)
  
    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quote.destroy
  
    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream
    end
  end

  
  
  
  
  
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:name)
    end
end
