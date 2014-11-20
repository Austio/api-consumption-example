class CoursesController < ApplicationController
  def index
    @courses = CoursePaginator.new(current_user, params[:page])
  end

  def show
    @course = Course.new(current_user, params[:id])
  end

end