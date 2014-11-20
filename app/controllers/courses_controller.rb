class CoursesController < ApplicationController
  def index
    @courses = CoursePaginator.new(current_user, params[:page])
  end

  def show
    @course = CourseFactory.new(current_user, params[:id]).course
  end

end