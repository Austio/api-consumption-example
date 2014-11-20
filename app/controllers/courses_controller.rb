class CoursesController < ApplicationController
  def index

  end

  def show
    @course = Course.new(current_user, params[:id]).show
  end


end