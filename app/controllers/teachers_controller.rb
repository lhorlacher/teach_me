class TeachersController < ApplicationController
  def show
  	@teacher = User.find(params[:id])
  	@students = User.where(teacher_id: params[:id])
  end
end
