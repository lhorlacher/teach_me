class StudentsController < ApplicationController
	before_action :verify_teacher
  
  def index
  	@students = User.where(teacher_id: params[:teacher_id])
  end

  def show
  	@student = User.find(params[:id])
  end

  private

  def verify_teacher
  	if current_user.student?
  		redirect_to lesson_index_path(current_user)
  	end
  end
end
