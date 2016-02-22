class UpdateExistingApplications < ActiveRecord::Migration
  def up
    Event.new(title: 'Sydney - August 21-22, 2015').save
    event = Event.last
    Application.update_all(event_id: event.id)
    Event.new(title: 'Sydney - April 1-2, 2016').save
  end
end
