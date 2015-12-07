class VotesController < ApplicationController

  def create
    @quote = Quote.find(params[:quote_id])
    @vote = current_user.votes.new vote_params
    @vote.quote = @quote
    if @vote.save
      redirect_to @quote, notice: "Voted!"
    else
      flash.now[:alert] = "Something went wrong!"
      redirect_to @quote
    end
  end

  def update
    @quote = Quote.find params[:quote_id]
    @vote = current_user.votes.find params[:id]
    if @vote.update vote_params
      redirect_to @quote, notice: "Voted!"
    else
      flash.now[:alert] = "Something went wrong!"
      redirect_to @quote
    end
  end

  def destroy
    @quote = Quote.find params[:quote_id]
    @vote = current_user.votes.find params[:id]
    @vote.destroy
    redirect_to @quote, notice: "Vote cancelled"
  end

  private
  def vote_params
    params.require(:vote).permit(:is_up)
  end
end
