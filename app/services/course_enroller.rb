class CourseEnroller < Struct.new(:user, :course)
  def is_enrolled?
    user.enrollments.pluck(:course_id).include? course.id
  end

  def enroll
    return nil if is_enrolled?
    response = CanvasAPI::Course.new(user).enroll(course.id)

    if response["status"] == 201
      user.enrollments.create(course_id: course.id) unless is_enrolled?
    else
      return nil
    end
  end


end