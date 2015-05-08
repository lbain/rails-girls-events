# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string
#  track                  :string
#  previous_attendant     :boolean
#  programming_experience :text
#  reason                 :text
#  tshirt_size            :string
#  tshirt_color           :string
#  status                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  under_18               :boolean
#

class User < ActiveRecord::Base
end
