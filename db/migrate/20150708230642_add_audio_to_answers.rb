class AddAudioToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :audio, :string
  end
end
