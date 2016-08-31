class LessonsController < ApplicationController
  before_action :verify_teacher, except: [:index]
	before_action :student_by_id, only: [:index, :new, :create]
	before_action :lesson_by_id, only: [:edit, :update, :destroy]

  def index
  	@lessons = @student.lessons.order('lesson_date')
  end

  def new
  	@lesson = Lesson.new
  end

  def create
  	@lesson = @student.lessons.new(lesson_params)

  	if @lesson.save
  		redirect_to assignments_path(@lesson)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update

  	if @lesson.update(lesson_params)
  		redirect_to assignments_path(@lesson)
  	else
  		render :edit
  	end
  end

  	def destroy
  		@user = User.find(@lesson.user_id)
  		@lesson.destroy
  		redirect_to lessons_path(@user)
  	end

  	private

  		def lesson_params
  			params.require(:lesson).permit(:lesson_date, :feedback, :notes)
  		end

  		def student_by_id
  			@student = User.find(params[:student_id])
  		end

  		def lesson_by_id
  			@lesson = Lesson.find(params[:id])
  		end

      def verify_teacher
        if current_user.student?
          redirect_to lessons_path(current_user)
        end
      end
end
