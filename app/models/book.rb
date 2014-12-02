class Book < ActiveRecord::Base
  has_many :recommentations

  validates :title, :author, :asin, presence: true
end
