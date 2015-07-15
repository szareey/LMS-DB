class AddAttachmentAudioToAnswers < ActiveRecord::Migration
  def change
    change_table :answers do |t|
      t.attachment :audio
    end
  end
end
