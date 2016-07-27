class Award < ApplicationRecord
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, dependent: :destroy
  validates_attachment_content_type :photo, content_type: ["image/jpeg", "image/gif", "image/png"]
  validates_presence_of :title
end
