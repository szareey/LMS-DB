teacher = Teacher.create(
    first_name: 'Sana',
    last_name: 'Zareey',
    email: 'szareey@nancycampbell.ca',
    password: 'test123'
  )

Question.create(
  question: File.open("#{Rails.root}/public/questions/q1.png"),
  user_id: teacher.id,  
  marks: 10
)

Question.create(
  question: File.open("#{Rails.root}/public/questions/q2.png"),
  user_id: teacher.id,  
  marks: 15
)

Question.create(
  question: File.open("#{Rails.root}/public/questions/q3.png"),
  user_id: teacher.id,  
  marks: 10
)

Question.create(
  question: File.open("#{Rails.root}/public/questions/q4.png"),
  user_id: teacher.id,  
  marks: 15
)

Question.create(
  question: File.open("#{Rails.root}/public/questions/q5.png"),
  user_id: teacher.id,  
  marks: 15
)

Question.create(
  question: File.open("#{Rails.root}/public/questions/q6.png"),
  user_id: teacher.id,  
  marks: 10
)

student = Student.create(
    first_name: 'Logan',
    last_name: 'Benadryl',
    email: 'logan@gmail.com',
    password: 'test123'
  )

student = Student.create(
    first_name: 'Jacob',
    last_name: 'Benadryl',
    email: 'jacob@gmail.com',
    password: 'test123'
  )
  
student = Student.create(
    first_name: 'Susan',
    last_name: 'Benadryl',
    email: 'susan@gmail.com',
    password: 'test123'
  )

student = Student.create(
    first_name: 'Gabriel',
    last_name: 'Benadryl',
    email: 'gabe@gmail.com',
    password: 'test123'
  )