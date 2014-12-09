class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :choice
  belongs_to :participation
end
