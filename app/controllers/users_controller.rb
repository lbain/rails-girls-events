class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :show, :update, :update_user_status]

  def new
    @user = User.new
    @user.applications.build
  end

  def create
    @user = User.find_by_email(user_params[:email])

    if @user
      @user.applications.new application_params
    else
      @user = User.new user_params
    end
    application = @user.applications.last

    # TODO: This should be a (hidden?) field element based on when the applications open
    # This is much easier for now, but will only support one event at a time
    # and the hard coding would need to be updated for the next event
    application.event = Event.where("title like ?", "%April 1-2, 2016%").first

    if @user.valid? && application.valid?
      @user.save
      application.send_application_thanks
    end
    render :new
  end

  def edit
  end

  def destroy
    user = User.find(params[:id])
    if user
      user.destroy
    end
    redirect_to users_path
  end

  def show
    @admin = current_admin
    @admin_page = true
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def data
    @users = User.all
    @admin_page = true
  end

  # Left separate from update since it's not for admin
  def update_user_status
    @user.update(user_status: params[:status])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, applications_attributes: Application.allowed_params, comments: [:comment])
  end

  def application_params
    user_params[:applications_attributes]['0']
  end

  def find_user
    @user = User.find(params[:id])
  end
end
