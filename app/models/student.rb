require 'bcrypt'
class Student < ActiveRecord::Base
  include BCrypt

  has_many :memberships
  has_many :organizations, through: :memberships #student.organizations should return the list of organization the student is a member, but not a leader

  has_many :presidencies, class_name: "Organization", foreign_key: "president_id" #student.presidencies should return the list of organization led by the student






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

