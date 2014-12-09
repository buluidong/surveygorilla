class Participation < ActiveRecord::Base
  # Remember to create a migration!
  has_many :responses
  belongs_to :survey
  belongs_to :taker, class_name: "User"
end
