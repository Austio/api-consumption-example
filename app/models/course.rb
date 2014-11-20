class Course

  def initialize(user, course_id)
    @response = CanvasAPI::Course.new(user).get_course(course_id)
  end


  #deletes all attributes to the body, i.e. :code, description, etc
  def method_missing(m)
    body[m.to_s] || 'Not available'
  end

  private

  def body
    @response["body"] || []
  end

end