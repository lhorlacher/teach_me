class TeachersController < ApplicationController
  def show
  	@teacher = User.find(params[:id])
  end
end
