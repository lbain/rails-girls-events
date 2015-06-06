# == Schema Information
#
# Table name: admins
#
#  id         :integer          not null, primary key
#  username   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Admin < ActiveRecord::Base
  has_many :votes
  has_many :comments
end
