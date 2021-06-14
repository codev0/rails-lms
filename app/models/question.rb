class Question < ApplicationRecord
  belongs_to :examination
  has_many :answers
end
