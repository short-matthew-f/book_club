class Recommendation < ActiveRecord::Base
  belongs_to :recommender, class_name: User
  belongs_to :book
  belongs_to :club
  
  validates :recommender, :book, :club, presence: true
  validates :description, :inscription, presence: true
end
