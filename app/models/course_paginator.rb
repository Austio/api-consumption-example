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
    @page_number - 1
  end

  def course(int)

  end

  def next_page
    if length == 2
      @page_number+1
    end
  end

  def list
    @response["body"]
  end

end