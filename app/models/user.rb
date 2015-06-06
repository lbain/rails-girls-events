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
#  admin_status           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  under_18               :boolean
#  user_status            :string
#

class User < ActiveRecord::Base
  acts_as_commentable

  has_many :votes

  def count_up_votes
    @votes = Vote.all
    @votes.select{|vote| vote.user_id == self.id && vote.vote_type == 'up'}.count
  end

  def count_down_votes
    @votes = Vote.all
    @votes.select{|vote| vote.user_id == self.id && vote.vote_type == 'down'}.count
  end

  def send_application_thanks
    UserMailer.application_recieved(self).deliver
  end

  def send_invitation
    UserMailer.application_success(self).deliver
  end

  def admin_status_icon
    case admin_status
    when 'applied'
      'fa-exclamation-triangle'
    when 'approved'
      'fa-check'
    when 'deferred'
      'fa-clock-o'
    when 'rejected'
      'fa-times'
    end
  end

  def user_status_icon
    case user_status
    when 'accepted'
      'fa-check'
    when 'declined'
      'fa-times'
    end
  end
end
