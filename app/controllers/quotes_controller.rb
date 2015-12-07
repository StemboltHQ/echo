class QuotesController < ApplicationController

  def show
    @quote = Quote.find params[:id]
    @vote = @quote.vote_for current_user
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = current_user.quotes.new quote_params
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

  def destroy

  end

  private
  def quote_params
    params.require(:quote).permit(:author, :supplier, :body, :date,
                                                  :date, :location)
  end
end
