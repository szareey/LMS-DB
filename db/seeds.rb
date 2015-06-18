teacher = Teacher.create(
    first_name: 'Sana',
    last_name: 'Zareey',
    email: 'szareey@nancycampbell.ca',
    password: 'test123'
  )

q1 = Question.create(
  question: 'http://img.sparknotes.com/content/testprep/bookimgs/sat2/math2c/0056/tan(theta)=sin(theta).gif',
  user_id: teacher.id  
)

student = Student.create(
    first_name: 'Logan',
    last_name: 'Benadryl',
    email: 'logan@gmail.com',
    password: 'test123'
  )

Answer.create(
  question_id: q1.id,
  user_id: student.id,
  answer: "this is the answer"
  )

  