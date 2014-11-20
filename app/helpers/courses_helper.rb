module CoursesHelper

  def paginate_course_link_to (course)
    if course
      link_to course.name, course_path(course.id)
    end
  end

  def previous_course_page_link (page_id)
    if page_id
      link_to "< Previous", courses_path(:page => page_id)
    end
  end

  def next_course_page_link (page_id)
    if page_id
      link_to "Next >", courses_path(:page => page_id)
    end
  end

end