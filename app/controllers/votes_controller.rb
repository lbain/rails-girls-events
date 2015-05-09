class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    # binding.pry
    @vote = Vote.new vote_params.merge({admin_id: @current_user.id})
    @vote.save
    redirect_to user_path(params[:user_id])
  end

  def update
    # @user = User.find params[:id]
    # @user.update(:status => params[:status])
    # redirect_to user_path
  end

  def count_up_votes
    @votes = Vote.all
    @user = User.find params[:id]
    @votes.select{|vote| vote.user_id == @user.id && vote.vote_type == 'up'}.count
  end

  def count_down_votes
    @votes = Vote.all
    @user = User.find params[:id]
    @votes.select{|vote| vote.user_id == @user.id && vote.vote_type == 'down'}.count
  end

  private
  def vote_params
    params.permit(:user_id, :vote_type)
  end

end