class AddAttachmentImageToQuestionTempImages < ActiveRecord::Migration
  def self.up
    change_table :question_temp_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :question_temp_images, :image
  end
end
