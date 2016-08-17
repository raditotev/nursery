class Testemonial < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description

  default_scope -> { order(created_at: :desc) }
end
