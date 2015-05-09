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
    @admin = @current_user
  end

  def thanks
  end

  def confirmation
  end

  def user_status_thanks
  end

  def update_user_status
    @user = User.find params[:id]
    @user.update(user_status: params[:status])
    redirect_to user_status_thanks_path
  end

  def update_admin_status
    @user = User.find params[:id]
    @user.update(admin_status: params[:status])
    redirect_to user_path
  end

  private
  def user_params
    params[:user].permit(:name, :email, :track, :under_18, :previous_attendant, :programming_experience, :reason, :tshirt_size, :tshirt_color, :status)
  end

end
