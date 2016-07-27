class AddAttachmentDocumentToNewsletters < ActiveRecord::Migration
  def self.up
    change_table :newsletters do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :newsletters, :document
  end
end
