# == Schema Information
#
# Table name: applications
#
#  id                     :integer          not null, primary key
#  user_id                :integer
#  track                  :string
#  over_18                :boolean
#  previous_attendance    :string
#  programming_experience :text
#  reason                 :text
#  tshirt_size            :string
#  admin_status           :string
#  user_status            :string
#  gender                 :string
#  dietary_requirements   :json
#  extra_info             :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  event_id               :integer
#

class Application < ActiveRecord::Base
  validates :track, :previous_attendance, :programming_experience,
            :reason, :tshirt_size, :gender, presence: true
  validates_inclusion_of :over_18, in: [true, false]


  # relations
  belongs_to :user
  belongs_to :event
  has_many :votes

  acts_as_commentable
  accepts_nested_attributes_for :comments

  # scopes
  scope :needs_admin_response, -> { where('admin_status=? OR admin_status=?', 'applied', 'deferred') }
  scope :has_admin_response, -> { where('admin_status!=? AND admin_status!=?', 'applied', 'deferred') }
  scope :beginner_track, -> { where(track: 'beginner') }
  scope :next_track, -> { where(track: 'next') }
  scope :attending, -> { where(user_status: 'accepted') }

  def self.allowed_params
    [ :track, :over_18, :previous_attendance, :programming_experience, :reason,
      :tshirt_size, :admin_status, :user_status, :gender, {dietary_requirements: []},
      :extra_info, { comments_attributes: Comment.allowed_params }]
  end

  def count_up_votes
    @votes = Vote.all
    @votes.select{|vote| vote.application_id == self.id && vote.vote_type == 'up'}.count
  end

  def count_down_votes
    @votes = Vote.all
    @votes.select{|vote| vote.application_id == self.id && vote.vote_type == 'down'}.count
  end

  def age
    if over_18
      'Over 18'
    else
      'Under 18'
    end
  end

  def important_attributes
    attributes = []
    attributes << track if track == 'next'
    attributes << gender if gender == 'Male'
    attributes << age unless over_18
    attributes
  end

  def send_application_thanks
    UserMailer.application_received(self).deliver
  end

  def needs_admin_response?
    admin_status == 'applied' || admin_status == 'deferred'
  end

  def send_admin_status_email
    case admin_status
    when 'approved'
      UserMailer.application_success(self).deliver
    when 'deferred'
      UserMailer.application_deferred(self).deliver
    when 'rejected'
      UserMailer.application_rejected(self).deliver
    end
  end

  # TODO: move to helpers - it's only relevant for the views
  def admin_status_icon
    case admin_status
    when 'approved'
      'fa-check'
    when 'deferred'
      'fa-clock-o'
    when 'rejected'
      'fa-times'
    end
  end

  # TODO: move to helpers - it's only relevant for the views
  def user_status_icon
    case user_status
    when 'accepted'
      'fa-check'
    when 'declined'
      'fa-times'
    end
  end

#FOR the data page
  def self.applied_count
    User.where(:admin_status => 'applied').count
  end

  def self.approved_count
    User.where(:admin_status => 'approved').count
  end

  def self.deferred_count
    User.where(:admin_status => 'deferred').count
  end

  def self.rejected_count
    User.where(:admin_status => 'rejected').count
  end

  def self.accepted_count
    User.where(:user_status => 'accepted').count
  end

  def self.declined_count
    User.where(:user_status => 'declined').count
  end

  def self.beginner_count
    User.where(:track => 'beginner', :user_status => 'accepted').count
  end

  def self.next_count
    User.where(:track => 'next', :user_status => 'accepted').count
  end

  def self.has_dietary_requirement
    users = User.where(:user_status => 'accepted')
    users_without_nil = users.select{|u| !u[:dietary_requirements].nil?}
    users_without_nil.select {|u|u[:dietary_requirements].to_a.exclude? 'none'}
  end

  def self.xs_count
    User.where(:tshirt_size => 'xs').count
  end

  def self.s_count
    User.where(:tshirt_size => 's').count
  end

  def self.m_count
    User.where(:tshirt_size => 'm').count
  end

  def self.l_count
    User.where(:tshirt_size => 'l').count
  end

  def self.xl_count
    User.where(:tshirt_size => 'xl').count
  end
end
