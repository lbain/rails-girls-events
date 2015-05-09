class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      UserMailer.application_recieved(@user).deliver
    end
    render :new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    @admin = Admin.find(13)
  end

  def thanks
  end

  def confirmation
  end

  def status
    @user = User.find params[:id]
    @user.update(:status => params[:status])
    redirect_to user_path
  end

  def self.count_up_votes(user_id)
    @votes = Vote.all
    @user = User.find params[:id]
    @votes.select{|vote| vote.user_id == @user.id && vote.vote_type == 'up'}.count
  end

  def self.count_down_votes(user_id)
    @votes = Vote.all
    @user = User.find params[:id]
    @votes.select{|vote| vote.user_id == @user.id && vote.vote_type == 'down'}.count
  end

  private
  def user_params
    params[:user].permit(:name, :email, :track, :under_18, :previous_attendant, :programming_experience, :reason, :tshirt_size, :tshirt_color, :status)
  end

end
