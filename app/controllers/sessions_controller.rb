class SessionsController < Devise::SessionsController

  def create
	  user = User.find_by_email(params[:user][:email])
   	if user
    	if user.valid_password?(params[:user][:password])
        flash[:notice] = "---------Log-in Sucessfully----------"
        sign_in(user)
        redirect_to root_path
      else
        flash[:alert]= "--------Incorrect password-----------"
        redirect_to  user_session_path
      end
    else
        flash[:alert]="---------User not found--------------"
        redirect_to  user_session_path
    end
  end

end
