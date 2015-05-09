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

  def count_up
    @votes = Vote.all
    @user = User.find params[:id]
    @votes.select{|vote| vote.user_id == @user.id && }.count
  end

  def count_down
    @votes = Vote.all
    @user = User.find params[:id]
    @votes.select{|vote| vote.user_id == @user.id && }.count
  end

  private
  def vote_params
    params.permit(:user_id, :vote_type)
  end

end
