class UsersController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def confirmation
  end

  private
  def user_params
      params.permit(:name, :email, :track, :age, :previous_attendant, :programming_experience, :reason, :tshirt_size, :tshirt_color, :status)
  end

end
