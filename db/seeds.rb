
# Admin
User.destroy_all
User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
puts 'Admin created'

#Departments
Department.destroy_all
ko = Department.create(title: 'КО')
co = Department.create(title: 'ЦО')
knvs = Department.create(title: 'КНВШ')
puts 'Departments created'

#Sections
Category.destroy_all
Category.create(title: "Каникулы", department_id: ko.id)
Category.create(title: "Общие новости")
Category.create(title: "Научная деятельность", department_id: knvs.id)
Category.create(title: "Конкурс", department_id: knvs.id)
Category.create(title: "Олимпиада РСОШ", department_id: ko.id)
Category.create(title: "Всероссийская олимпиада", department_id: co.id)
Category.create(title: "Региональная олимпиала", department_id: co.id)
puts 'Categories created'

#Subjects
Subject.destroy_all
subjects = %w(Физики Химия Алгебра Геометрия Георгафия Физкультура Биология)
subjects.each do |subject|
  Subject.create(title: subject)
end
puts 'Subjects created'

#Site Questions
SiteQuestion.destroy_all
SiteQuestion.create(name: "Тема", question: "Подскажите, какую акустику лучше выбрать?", email: "artemyan@list.ru")
SiteQuestion.create(name: "Слава", question: "Каким порошоком лучше чистить водосток?", email: "autist@bk.ru")
SiteQuestion.create(name: "Виталик", question: "Чем заряжать 7 айфон?", email: "vitalik@mail.ru")
puts 'Site questions created'

#Frequent Questions
FrequentQuestion.destroy_all
FrequentQuestion.create(sn: 1, question: "Каким мылом лучше мыться", answer: "Лучше всего использовать дегтярное мыло", published: true)
FrequentQuestion.create(sn: 2, question: "Какой цвет самый красивый?", answer: "Светло синий", published: true)
FrequentQuestion.create(sn: 3, question: "Где лучшие тусовки?", answer: "У нас в клубе")