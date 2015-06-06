class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    # ADD ME BACK IN WHEN ADMINS ARE AVAILABLE
    # @vote = Vote.new vote_params.merge({admin_id: @current_user.id})
    # @vote.save
    redirect_to user_path(params[:user_id])
  end

  private
  def vote_params
    params.permit(:user_id, :vote_type)
  end

end
