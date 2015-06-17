class Student < ActiveRecord::Base

  has_many :answers, through: :questions

end
