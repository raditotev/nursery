class Testemonial < ApplicationRecord
  has_one :photo, as: :imageable, dependent: :destroy
  # accepts_nested_attributes_for :photo

  validates_presence_of :title
  validates_presence_of :description

  default_scope -> { order(created_at: :desc) }
end
