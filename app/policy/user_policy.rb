class UserPolicy
  attr_reader :edit_user, :current_user

  def initialize(edit_user, current_user)
    @edit_user = edit_user
    @current_user = current_user
  end

  def able_to_moderate?
    @current_user['id'] == @edit_user.user_id ? true : false
  end

end
