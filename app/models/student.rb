require 'bcrypt'
class Student < ActiveRecord::Base
  include BCrypt
  validates :email, presence: true,#,
                          format: { with: /.+\@.+\..+/,
                                        message: "That is not the proper email format" },
                          uniqueness: true
  validates :password, confirmation: true
  # validates :password_confirmation, presence: true ## causing errors


  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(email, password)
    student = Student.find_by_email(email)
    if student && student.password == password
            student
      else
            nil
    end
  end
end

