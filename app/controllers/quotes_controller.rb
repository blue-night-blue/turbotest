class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ edit update destroy ]

  def index
    @quotes = Quote.ordered
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

        # ■■■■■■■■■■turbo該当箇所■■■■■■■■■■
        format.turbo_stream { flash.now.notice = "投稿しました" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
        
        # ■■■■■■■■■■turbo該当箇所■■■■■■■■■■
        format.turbo_stream { flash.now[:notice] = "修正しました" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quote.destroy
  
    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
        
      # ■■■■■■■■■■turbo該当箇所■■■■■■■■■■
      format.turbo_stream { flash.now[:notice] = "削除しました" }
    end
  end

  
  
  
  
  
  
  
  private
    def set_quote
      @quote = Quote.find(params[:id])
    end

    def quote_params
      params.require(:quote).permit(:name)
    end
end
