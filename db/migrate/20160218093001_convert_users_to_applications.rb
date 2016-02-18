class ConvertUsersToApplications < ActiveRecord::Migration
  def up
    User.all.each do |user|
      Application.create(user.to_application_hash)
    end
  end
end
