# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string
#  track                  :string
#  previous_attendance    :string
#  programming_experience :text
#  reason                 :text
#  tshirt_size            :string
#  admin_status           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  under_18               :boolean
#  user_status            :string
#  gender                 :string
#  dietary_requirements   :json
#  extra_info             :text
#

class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  # relations
  has_many :applications
  accepts_nested_attributes_for :applications

  def to_application_hash
    {
      track: track,
      previous_attendance: previous_attendance,
      programming_experience: programming_experience,
      reason: reason,
      tshirt_size: tshirt_size,
      admin_status: admin_status,
      user_id: id,
      over_18: !under_18,
      user_status: user_status,
      gender: gender,
      dietary_requirements: dietary_requirements,
      extra_info: extra_info
    }
  end
end
