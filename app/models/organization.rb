class Organization < ActiveRecord::Base
    belongs_to :president, class_name: "Student" #organization.president should return the student that is leading the organization
    has_many :memberships
    has_many :members, through: :memberships, source: :student#organization.members should return a list of members
end
