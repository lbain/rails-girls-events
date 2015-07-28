module UsersHelper
  def displayed_attributes
    { name: "Name",
      email: "Email",
      gender: "Gender",
      under_18: "Age",
      track: "Track",
      previous_attendance: "Rails Girls experience",
      programming_experience: "Programming experience",
      reason: "Reason for applying" }
  end
end
