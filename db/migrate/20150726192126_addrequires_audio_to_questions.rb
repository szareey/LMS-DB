class AddrequiresAudioToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answerRequiresAudio, :boolean, default: false
    add_column :questions, :questionRequiresAudio, :boolean, default: false
  end
end
