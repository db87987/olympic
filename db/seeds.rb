# Admin
User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
puts 'Admin created'

#Departments
ko = Department.create(title: 'КО')
co = Department.create(title: 'ЦО')
knvs = Department.create(title: 'КНВШ')
puts 'Departments created'

#Sections
Category.create(title: "Каникулы", department_id: ko.id)
Category.create(title: "Общие новости")
Category.create(title: "Научная деятельность", department_id: knvs.id)
Category.create(title: "Конкурс", department_id: knvs.id)
Category.create(title: "Олимпиада РСОШ", department_id: ko.id)
Category.create(title: "Всероссийская олимпиада", department_id: co.id)
Category.create(title: "Региональная олимпиала", department_id: co.id)
puts 'Categories created'

#Subjects
subjects = %w(Физики Химия Алгебра Геометрия Георгафия Физкультура Биология)
subjects.each do |subject|
  Subject.create(title: subject)
end
puts 'Subjects created'