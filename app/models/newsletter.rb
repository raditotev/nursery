class Newsletter < ApplicationRecord
  validates_presence_of :name
  has_attached_file :document, dependent: :destroy
  validates_attachment :document,
                                      content_type: { content_type: "application/pdf" },
                                      presence: true
end
