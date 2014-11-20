class EnrollmentsController < ApplicationController
  def index
    @enrollments = current_user.enrollments
  end

  def create
    CourseEnroller.new(current_user, Course.new(params[:course_id])).enroll
    redirect_to course_path(params[:course_id])
  end
end