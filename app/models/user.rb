# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string
#  track                  :string
#  age                    :integer
#  previous_attendant     :boolean
#  programming_experience :text
#  reason                 :text
#  tshirt_size            :string
#  tshirt_color           :string
#  status                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
end
