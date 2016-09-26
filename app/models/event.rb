class Event < ApplicationRecord
  validates_presence_of :description, :start_date, :end_date
end
