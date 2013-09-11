class Activator
  def initialize(user)
    @user = user
  end

  def activate
    @user.activation_code = nil
    @user.activation_expires_at = nil
    @user.activated_at = nil
    @user.save
  end
end


