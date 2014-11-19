class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   has_many :friendships, dependent: :destroy
   has_many :friends, through: :friendships

   def befriend(user)
     unless self.friends.include?(user)
       self.friends << user
       user.friends << self
     end
   end
   
   def unfriend(user)
     if self.friends.include?(user)
       Friendship.find_by(user: self, friend: user).destroy
       Friendship.find_by(user: user, friend: self).destroy
     end
   end
end
