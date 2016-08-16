class Course < ActiveRecord::Base
  validates :title, presence: true
end
