class Course


  def initialize(user, course_id)
    @request = CanvasAPI::Course.new(user).get_course(course_id)
  end


  def show
    @request
  end



end