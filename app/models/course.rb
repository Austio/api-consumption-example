class Course

  def initialize(user, course_id)
    @request = CanvasAPI::Course.new(user).get_course(course_id)
  end


  #deletes all attributes to the body, i.e. :code, description, etc
  def method_missing(m)
    course[m.to_s] || 'Not available'
  end

  private

  def course
    @request["body"]
  end

end