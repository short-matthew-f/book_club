module UsersHelper
  def star_class(user)
    user.friends.include?(current_user) ? "friend" : ""
  end
end
