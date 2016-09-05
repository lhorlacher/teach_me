class AssignmentsController < ApplicationController
  before_action :verify_teacher, except: [:index, :practice]
	before_action :lesson_by_id, only: [:index, :practice, :new, :create]
	before_action :assignment_by_id, only: [:play, :edit, :update, :destroy]
  
  def index
  	@assignments = @lesson.assignments
    @student = User.find(@lesson.user_id)
  end

  def practice
  	@assignments = @lesson.assignments
  end

  def new
  	@assignment = Assignment.new
  end

  def create
  	@assignment = @lesson.assignments.new(assignment_params)

  	if @assignment.save
  		redirect_to assignments_path(@lesson)
  	else
  		render :new
  	end
  end

  def play
    plays = @assignment.plays.to_i + 1
    @assignment.update(plays: plays)
    redirect_to assignments_path(@assignment.lesson_id)
  end

  def edit
  end

  def update

  	if @assignment.update(assignment_params)
  		redirect_to assignments_path(@assignment.lesson_id)
  	else
  		render :edit
  	end
  end

  def destroy
	@assignment.destroy
	redirect_to assignments_path(@assignment.lesson_id)
  end
  		
  private

  def assignment_params
  	params.require(:assignment).permit(:book, :title, :page, :per_day, :days_per_week, :notes, :plays)
  end

  def lesson_by_id
  	@lesson = Lesson.find(params[:lesson_id])
  end

  def assignment_by_id
  	@assignment = Assignment.find(params[:id])
  end

  def verify_teacher
    if current_user.student?
      redirect_to lessons_path(current_user)
    end
  end
end
