module UsersHelper
  def user_displayed_attributes
    { name: "Name",
      email: "Email" }
  end

  def previous_application_attributes
    { track: "Track",
      admin_status: "Admin status",
      user_status: "User status" }
  end
end
