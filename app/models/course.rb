class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy
end
