class Survey < ActiveRecord::Base
  # Remember to create a migration!
  has_many :participations
  has_many :questions
  belongs_to :creator, class_name: "User"
  has_many :takers, through: :participations
end
