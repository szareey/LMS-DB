# == Schema Information
#
# Table name: questions
#
#  id                    :integer          not null, primary key
#  teacher_id            :integer
#  question_file_name    :string
#  question_content_type :string
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
#  description           :string
#

class Question < ActiveRecord::Base
  has_attached_file :question, styles: { 
                                 medium: "300x300>", 
                                 thumb: "100x100>"
                               }, 
                               default_url: "/images/:style/missing.png"
  do_not_validate_attachment_file_type :question
  
  has_many :answers
  has_and_belongs_to_many :ministry_specifics,
                          class_name: 'MinistryDoc::Specific'
  belongs_to :teacher, class_name: 'User::Teacher'

  attr_accessor :image_ids
end

