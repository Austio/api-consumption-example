class CoursePaginator
  attr_reader :response

  def initialize (user, page_number)
    @response = CanvasAPI::Course.new(user).get_courses(page_number)
  end

  def length
    list.length
  end

  def list
    @response["body"]
  end

end