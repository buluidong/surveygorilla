class User < ActiveRecord::Base
  # Remember to create a migration!
   validates :name, presence: true
  validates :username, presence: true, uniqueness: true, format: { with: /\w+@\w+\.\w{2,}/}

  has_many :participations, foreign_key: :taker_id
  has_many :created_surveys, class_name: "Survey", foreign_key: :creator_id
  has_many :taken_surveys, through: :participations, source: :survey


  def self.authenticate(username, password)
    user = User.find_by_username(username)
    return user if user && (user.password == password)
    nil
  end

end