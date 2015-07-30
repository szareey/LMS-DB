class AddrequiresAudioToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_has_audio, :boolean, default: false
    add_column :questions, :question_has_audio, :boolean, default: false
  end
end
