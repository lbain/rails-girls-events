class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new vote_params.merge({admin_id: current_admin.id})
    @vote.save
    redirect_to user_path(params[:user_id])
  end

  private
  def vote_params
    params.permit(:user_id, :vote_type)
  end

end
