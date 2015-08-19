# == Schema Information
#
# Table name: questions
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  question_file_name    :string(255)
#  question_content_type :string(255)
#  question_file_size    :integer
#  question_updated_at   :datetime
#  created_at            :datetime
#  updated_at            :datetime
#  marks                 :integer
#  knowledge             :boolean          default(FALSE)
#  thinking              :boolean          default(FALSE)
#  communication         :boolean          default(FALSE)
#  application           :boolean          default(FALSE)
#  answer_has_audio      :boolean          default(FALSE)
#  question_has_audio    :boolean          default(FALSE)
#

class Question < ActiveRecord::Base

  has_attached_file :question, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  do_not_validate_attachment_file_type :question

  has_many :answers
  has_and_belongs_to_many :ministry_specifics
  belongs_to :teacher, class_name: 'Teacher', foreign_key: 'user_id'

end

