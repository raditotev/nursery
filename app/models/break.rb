class Break < ApplicationRecord
  validates_presence_of :start_date
  validates_presence_of :description
end
