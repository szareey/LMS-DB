teacher = User::Teacher.create(
    first_name: 'Sana',
    last_name: 'Zareey',
    email: 'szareey@nancycampbell.ca',
    password: 'test123'
  )

Question.create(
  question: File.open("#{Rails.root}/public/questions/q1.png"),
  teacher: teacher,  
  marks: 10
)

Question.create(
  question: File.open("#{Rails.root}/public/questions/q2.png"),
  teacher: teacher,  
  marks: 15
)

Question.create(
  question: File.open("#{Rails.root}/public/questions/q3.png"),
  teacher: teacher,  
  marks: 10
)

Question.create(
  question: File.open("#{Rails.root}/public/questions/q4.png"),
  teacher: teacher,  
  marks: 15
)

Question.create(
  question: File.open("#{Rails.root}/public/questions/q5.png"),
  teacher: teacher,  
  marks: 15
)

Question.create(
  question: File.open("#{Rails.root}/public/questions/q6.png"),
  teacher: teacher,  
  marks: 10
)

student = User::Student.create(
    first_name: 'Logan',
    last_name: 'Benadryl',
    email: 'logan@gmail.com',
    password: 'test123'
  )

student = User::Student.create(
    first_name: 'Jacob',
    last_name: 'Benadryl',
    email: 'jacob@gmail.com',
    password: 'test123'
  )
  
student = User::Student.create(
    first_name: 'Susan',
    last_name: 'Benadryl',
    email: 'susan@gmail.com',
    password: 'test123'
  )

student = User::Student.create(
    first_name: 'Gabriel',
    last_name: 'Benadryl',
    email: 'gabe@gmail.com',
    password: 'test123'
  )

student = User::Student.create(
    first_name: 'Bean',
    last_name: 'Benadryl',
    email: 'bean@gmail.com',
    password: 'test123'
  )