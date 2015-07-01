class AddAttachmentFinalAnswerImgToAnswers < ActiveRecord::Migration
  def self.up
    change_table :answers do |t|
      t.attachment :final_answer_img
    end
  end

  def self.down
    remove_attachment :answers, :final_answer_img
  end
end
