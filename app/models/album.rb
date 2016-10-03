class Album < ApplicationRecord
  has_many :photos, as: :imageable, dependent: :destroy
  validates_presence_of :name
  default_scope -> { order(created_at: :desc) }
end
