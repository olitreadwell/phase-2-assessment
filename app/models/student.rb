require 'bcrypt'
class Student < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true,
                  format: { with: /.+\@.+\..+/,
                                  message: "That is not the proper email format" }
  validates :password, presence: true ####????
  validates_confirmation_of :password,
                              message: 'should match confirmation'
  validates :password_confirmation, presence: true
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
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
