helpers do

  def current_student
    @student ||= Student.find(session[:student_id]) if session[:student_id]
  end

end
