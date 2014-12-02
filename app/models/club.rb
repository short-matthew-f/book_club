class Club < ActiveRecord::Base
  belongs_to :owner, class_name: User
  
  delegate :members, to: :owner
  
  validates :owner, presence: true
end
