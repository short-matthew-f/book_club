class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :profile
         
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
   
  has_one  :club, foreign_key: :owner_id, dependent: :destroy
  
  has_many :recommendations, dependent: :destroy
  has_many :recommended_books, through: :recommendations, source: :book
  
  has_many :subscriptions, through: :friends, source: :club

  alias_method :members, :friends

  def befriend(user)
    unless self.friends.include?(user)
      self.friends << user
      user.friends << self
    end
  end
   
  def defriend(user)
    if self.friends.include?(user)
      Friendship.find_by(user: self, friend: user).destroy
      Friendship.find_by(user: user, friend: self).destroy
    end
  end
end
