# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  admin_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  vote_type  :string
#

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin

  def count
    
  end
end
