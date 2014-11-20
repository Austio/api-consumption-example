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

  def next
    link_to courses_path

  end

  def previous_page
    if @page_number > 1
      return "/courses?page=#{@page_number-1}"
    end
    ""
  end

  def next_page
    "/course?page=#{@page_number+1}"
  end

  def list
    @response["body"]
  end

end