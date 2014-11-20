module CoursesHelper

  def link_back_courses (course)
    if course
      link_to "Back to Courses", courses_path(:page => course.paginated_number)
    end
  end

  def paginate_course_link_to (course)
    if course
      link_to course.name, course_path(course.id)
    end
  end

  def previous_course_page_link (page_id)
    if page_id
      link_to "< Prev", courses_path(:page => page_id)
    end
  end

  def link_to_enroll(course)
    if CourseEnroller.new(current_user, course).is_enrolled?
      "Enrolled!"
    else
      link_to "Click to Enroll", enrollments_path(course_id: course.id), method: :post
    end
  end

  def next_course_page_link (page_id)
    if page_id
      link_to "Next >", courses_path(:page => page_id)
    end
  end

end