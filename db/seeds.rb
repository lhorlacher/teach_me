# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do 
	User.create(first_name: Faker::Pokemon.name,
		        last_name: Faker::GameOfThrones.city,
		        age: Faker::Number.between(10,20),
		        instrument: Faker::Music.instrument,
	            teacher_id: Faker::Number.between(1,1),
	            email: Faker::Internet.email,
				password: 'password',
				password_confirmation: 'password')

	# User.create(first_name: Faker::Pokemon.name,
	# 	        last_name: Faker::GameOfThrones.city,
	# 	        age: Faker::Number.between(10,20),
	# 	        instrument: Faker::Music.instrument,
	# 	        email: Faker::Internet.email)

	Lesson.create(lesson_date: Faker::Date.between(1.month.ago, Date.today),
				  feedback: Faker::Lorem.paragraph,
				  notes: Faker::Lorem.paragraph,
				  user_id: Faker::Number.between(2,50))

	Assignment.create(book: Faker::Book.title,
		              title: Faker::Book.title,
		              page: Faker::Number.between(1,50),
		              per_day: Faker::Number.between(1,10),
		              days_per_week: Faker::Number.between(3, 7),
		              notes: Faker::Lorem.paragraph,
		              plays: Faker::Number.between(1,70),
		              lesson_id: Faker::Number.between(1,50))
end