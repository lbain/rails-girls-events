class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new vote_params.merge({admin_id: current_admin.id})
    @vote.save
    redirect_to application_path(params[:application_id])
  end

  private
  def vote_params
    params.permit(:application_id, :vote_type)
  end

end
