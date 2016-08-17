class Newsletter < ApplicationRecord
  validates_presence_of :name
  has_attached_file :document, use_timestamp: false, dependent: :destroy
  validates_attachment :document,
                                      content_type: { content_type: "application/pdf" },
                                      presence: true
  default_scope -> { order(created_at: :desc) }
end
