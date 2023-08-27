class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ edit update destroy ]

  def index
    @quotes = Quote.ordered
    @quote = Quote.new
  end

  def new
    @quote = Quote.new
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)
    name = @quote.name
  
    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }

        # ■■■■■■■■■■turbo該当箇所■■■■■■■■■■
        format.turbo_stream { flash.now.notice = "#{name}を投稿しました" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    name = @quote.name
    if @quote.update(quote_params) && @quote.saved_change_to_attribute?(:name)
      respond_to do |format|
        if @quote.update(quote_params)
          format.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
          
          # ■■■■■■■■■■turbo該当箇所■■■■■■■■■■
          format.turbo_stream { flash.now[:notice] = "#{name}を修正しました" }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    name = @quote.name
    @quote.destroy
  
    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
        
      # ■■■■■■■■■■turbo該当箇所■■■■■■■■■■
      format.turbo_stream { flash.now[:notice] = "#{name}を削除しました" }
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
