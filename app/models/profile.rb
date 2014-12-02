class Profile < ActiveRecord::Base
  belongs_to :user
  
  validates :user, presence: true
  # validates :name, :location, :bio, presence: true
end
