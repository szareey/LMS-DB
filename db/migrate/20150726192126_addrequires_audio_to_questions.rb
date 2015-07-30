class AddrequiresAudioToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_requires_audio, :boolean, default: false
    add_column :questions, :question_requires_audio, :boolean, default: false
  end
end
