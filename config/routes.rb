Rails.application.routes.draw do
root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

# Teacher
#show
get 'teachers/:id', to: 'teachers#show', as: 'show_teacher'

# Student
#show
get 'students/:id', to: 'students#show', as: 'show_student'
#index
get 'teachers/:teacher_id/students', to: 'students#index', as: 'student_index'

# Lesson
#index
get 'students/:student_id/lessons', to: 'lessons#index', as: 'lessons'
#create
post 'students/:student_id/lessons', to: 'lessons#create'
#new
get 'students/:student_id/lessons/new', to: 'lessons#new', as: 'new_lesson'
#edit
get 'lessons/:id', to: 'lessons#edit', as: 'edit_lesson'
#update
put 'lessons/:id', to: 'lessons#update'
#destroy
delete 'lessons/:id', to: 'lessons#delete'

# Assignment
#index
get 'lessons/:lesson_id/assignments', to: 'assignments#index', as: 'assignments_index'
#practice
get 'lessons/:lesson_id/practice', to: 'assignments#practice', as: 'practice'
#new
get 'lessons/:lesson_id/assignments/new', to: 'assignments#new', as: 'new_assignment'
#create
post 'lessons/:lesson_id/assignments/new', to: 'assignments#create'
#edit
get 'assignments/:id', to: 'assignments#edit', as: 'edit_assignment'
#update
put 'assignments/:id', to: 'assignments#update'
#delete
delete 'assignments/:id', to: 'assignments#update', as: 'delete_assignment'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
