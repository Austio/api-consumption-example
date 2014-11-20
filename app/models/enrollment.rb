class Enrollment < ActiveRecord::Base
  belongs_to :user
  after_create :populate_course_name


  private
  def populate_course_name
    #NOTE TODO assuming that User.first is the administrator that will always have a way to communicate with API
    update(course_name: CourseFactory.new(User.first, course_id).course.name)
  end



end
