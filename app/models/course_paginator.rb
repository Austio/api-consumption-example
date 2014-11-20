class CoursePaginator
  attr_reader :response

  def initialize (user, page_number)
    @response = CanvasAPI::Course.new(user).get_courses(page_number)
    @page_number = page_number.try(:to_i) || 1
  end

  def length
    list.length
  end

  def next

  end

  def previous
    if @page_number > 1
      "/courses?page=#{@page_number}"
    end
  end

  def list
    @response["body"]
  end

end