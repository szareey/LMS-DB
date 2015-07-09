class AddAudioToAnswers < ActiveRecord::Migration
  def change
    change_table :answers do |t|
      t.string :audio
    end
  end
end
