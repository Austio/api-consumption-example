class CoursePaginator
  include ActionView::Helpers

  attr_reader :response

  def initialize (user, page_number)
    @response = CanvasAPI::Course.new(user).get_courses(page_number)
    @page_number = page_number.try(:to_i) || 1
  end

  def length
    list.length
  end

  def previous_page
    @page_number - 1 if @page_number > 1
  end

  def next_page
    if length == 2
      @page_number+1
    end
  end

  def course(int)
    if int % 2 == 1
      c = list.first
    else
      c = list.last
    end

    Course.new(c["id"], c["name"], c["code"], c["description"]) if c
  end


  def list
    @response["body"]
  end

end