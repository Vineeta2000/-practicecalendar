class RegistrationsController < Devise::RegistrationsController
  after_action :assign_roles , only: :create

  def create
    super
  end

  def assign_roles
    #byebug
    @role = Role.find(params[:user][:role_ids])
    @user.roles << @role
    #byebug
    if current_user.roles.map(&:name).include?(Role.second.name)
       @parent = User.first
       @user.update(parent_id: @parent.id)
     end
 #    @parent = User.find(params[:user][:user_ids])
 #    @user.parent_id = @parent.id
 end

end