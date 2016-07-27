class AddAttachmentPhotoToAwards < ActiveRecord::Migration
  def self.up
    change_table :awards do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :awards, :photo
  end
end
