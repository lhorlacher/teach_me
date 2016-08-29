class HomeController < ApplicationController
	skip_before_action :authenticate_user!

  def index
  	if !user_signed_in?
  		return render :index 
  	end
  	if current_user.teacher?
  		redirect_to student_index_path(current_user)
  	elsif current_user.student? && Lesson.where(user_id: current_user.id).any?
  		redirect_to assignment_index_path(Lesson.where(user_id: current_user.id).order('lesson_date').last)
  	else
  		redirect_to lesson_index_path(current_user)
  	end
  end
end
