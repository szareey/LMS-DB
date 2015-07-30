class UpdateQuestions < ActiveRecord::Migration
  
  def change
    add_reference :questions, :ministry_specific, index: true
    add_column :questions, :knowledge, :boolean, default: false
    add_column :questions, :thinking, :boolean, default: false
    add_column :questions, :communication, :boolean, default: false
    add_column :questions, :application, :boolean, default: false
  end
  
end
