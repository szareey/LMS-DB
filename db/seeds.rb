teacher = Teacher.create(
    first_name: 'Sana',
    last_name: 'Zareey',
    email: 'szareey@nancycampbell.ca',
    password: 'test123'
  )

Question.create(
  question: 'http://img.sparknotes.com/content/testprep/bookimgs/sat2/math2c/0056/tan(theta)=sin(theta).gif',
  user_id: teacher.id  
)

Question.create(
  question: 'http://localhost:3000/system/questions/questions/000/000/011/original/Screen_Shot_2015-06-18_at_5.05.08_PM.png?1434661621',
  user_id: teacher.id  
)

student = Student.create(
    first_name: 'Logan',
    last_name: 'Benadryl',
    email: 'logan@gmail.com',
    password: 'test123'
  )

  