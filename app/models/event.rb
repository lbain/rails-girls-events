# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  validates :title, presence: true

  has_many :applications

  # for the data page
  def total_application_count
    self.applications.count
  end

  def applied_count
    self.applications.where(admin_status:'applied').count
  end

  def approved_count
    self.applications.where(admin_status:'approved').count
  end

  def deferred_count
    self.applications.where(admin_status:'deferred').count
  end

  def rejected_count
    self.applications.where(admin_status:'rejected').count
  end

  def accepted_count
    self.applications.where(user_status:'accepted').count
  end

  def declined_count
    self.applications.where(user_status:'declined').count
  end

  def beginner_count
    self.applications.where(track: 'beginner', user_status: 'accepted').count
  end

  def next_count
    self.applications.where(track: 'next', user_status: 'accepted').count
  end

  def has_dietary_requirement
    applications = self.applications.where(user_status: 'accepted')
    applications.select do |a|
      !a[:dietary_requirements].nil? and a[:dietary_requirements].to_a.exclude? 'none'
    end
  end

  def xs_count
    self.applications.where(tshirt_size: 'xs').count
  end

  def s_count
    self.applications.where(tshirt_size: 's').count
  end

  def m_count
    self.applications.where(tshirt_size: 'm').count
  end

  def l_count
    self.applications.where(tshirt_size: 'l').count
  end

  def xl_count
    self.applications.where(tshirt_size: 'xl').count
  end
end
