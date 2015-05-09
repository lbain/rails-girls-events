class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      UserMailer.application_success(@user).deliver
    end
    render :new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
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

  private
  def user_params
    params[:user].permit(:name, :email, :track, :under_18, :previous_attendant, :programming_experience, :reason, :tshirt_size, :tshirt_color, :status)
  end

end
