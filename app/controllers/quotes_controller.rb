class QuotesController < ApplicationController

  def show
    @quote = Quote.find params[:id]
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new quote_params
    if @quote.save
      redirect_to @quote
    else
      render :new
    end
  end

  def edit
    @quote = Quote.find params[:id]
  end

  def update
    @quote = Quote.find params[:id]
    if @quote.update quote_params
      redirect_to @quote
    else
      render :edit
    end
  end

  def index
    @quote = Quote.new
    @quotes = Quote.all
  end

  def delete

  end

  private
  def quote_params
    params.require(:quote).permit(:author, :supplier, :body, :date,
                                                  :date, :location)
  end
end