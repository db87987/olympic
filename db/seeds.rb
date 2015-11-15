#Departments
Department.destroy_all
ko = Department.create(title: 'КО')
co = Department.create(title: 'ЦО')
knvs = Department.create(title: 'КНВШ')
puts 'Departments created'

#Users
User.destroy_all
admin = User.create(name: 'sys_admin', email: 'admin@admin.com', password: 'password', password_confirmation: 'password', role: 'sys_admin')
ko_admin = User.create(name: 'ko_admin', email: 'admin@ko.com', password: 'password', password_confirmation: 'password', role: 'admin', department_id: ko.id)
ko_user = User.create(name: 'ko_user', email: 'user@ko.com', password: 'password', password_confirmation: 'password', role: 'user', department_id: ko.id)
ko_user2 = User.create(name: 'ko_user2', email: 'user2@ko.com', password: 'password', password_confirmation: 'password', role: 'user', department_id: ko.id)
co_admin = User.create(name: 'co_admin', email: 'admin@co.com', password: 'password', password_confirmation: 'password', role: 'admin', department_id: co.id)
co_user = User.create(name: 'co_user', email: 'user@co.com', password: 'password', password_confirmation: 'password', role: 'user', department_id: co.id)
admin = User.create(name: 'external', email: 'external@external.com', password: 'password', password_confirmation: 'password', role: 'external')
puts 'Users created'

#Categories
Category.destroy_all
cat1 = Category.create(title: "Каникулы", department_id: ko.id)
cat2 = Category.create(title: "Общие новости")
cat3 = Category.create(title: "Научная деятельность", department_id: knvs.id)
cat4 = Category.create(title: "Конкурс", department_id: knvs.id)
cat5 = Category.create(title: "Олимпиада РСОШ", department_id: ko.id)
cat6 = Category.create(title: "Всероссийская олимпиада", department_id: co.id)
cat7 = Category.create(title: "Региональная олимпиала", department_id: co.id)
puts 'Categories created'

#Documents
Document.destroy_all
Category.all.each do |category|
  Document.create(title: category.title, category_id: category.id, text: "Описание к #{category.title}")
end

#Subjects
Subject.destroy_all
subjects = %w(Физики Химия Алгебра Геометрия Георгафия Физкультура Биология)
subjects.each do |subject|
  Subject.create(title: subject)
end
puts 'Subjects created'

#Events
Event.destroy_all
Event.create(title: "Событие КО", category_id: Category.pluck(:id).sample, start_date: (1..100).to_a.sample.days.ago, end_date: (10..100).to_a.sample.days.from_now, published: true, user_id: ko_user.id)
Event.create(title: "Событие КО", category_id: Category.pluck(:id).sample, start_date: (1..100).to_a.sample.days.ago, end_date: (10..100).to_a.sample.days.from_now, published: true, user_id: ko_user2.id)
Event.create(title: "Событие ЦО", category_id: Category.pluck(:id).sample, start_date: (1..100).to_a.sample.days.ago, end_date: (10..100).to_a.sample.days.from_now, published: true, user_id: co_user.id)

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