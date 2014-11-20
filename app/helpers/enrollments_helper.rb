module EnrollmentsHelper
  def enrollment_course_name(enrollment)
    enrollment.course_name || enrollment.id
  end
end