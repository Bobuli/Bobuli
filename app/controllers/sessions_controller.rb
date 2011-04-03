
class SessionsController < ApplicationController

 skip_filter :enforce_authentication

    def new
    end


    def create
      user = User.authenticate(params[:session][:name],params[:session][:password])
      if user == 1 
      	flash.now[:error] = "Your Account is not yet activated."
        render 'new'
      elsif user.nil?
        flash.now[:error] = "Invalid email/password combination."
        render 'new'
      else
      	sign_in(user)
        setTippgemeinschaft(Tippgemeinschaft.find_by_name(user.name))
        redirect_to user
      end
    end
    
    
    def destroy
      sign_out
      redirect_to '/signin'
    end  
    
    
    
    
    ######################################################################################################
    # => 				PASSWORD FORGOTTEN- FUCTIONALITY
    ######################################################################################################
    
    #  GET sssions/password_forgotten
    def password_forgotten
	  	respond_to do |format|
			format.html {}
			format.xml  { head :ok }
		end
    end


	# POST
	def reset
	 @user = User.find_by_email(params[:session][:email])
     if @user.nil? 
      	flash.now[:error] = "Your Account does not exsist."
        render 'password_forgotten'
     else
     	@user.reset_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
		@user.save
	
      	UserMailer.reset_password(@user).deliver
        flash.now[:notice] = "Changing your password requires confirming the link in email, we send you now"

        render 'new'
	 end
	end     


	def change_password
		@user = User.find_by_reset_code(params[:key])
		
	    respond_to do |format|
	      if !@user.nil?
	      	@user.reset_code = nil
	      	@user.save
	        format.html { }
	        format.xml  { head :ok }
	      else
	      	format.html { 
					      	flash.now[:error] = "Invalid Key!"
					        render 'new'
					    }    
	      end	
		end
	end
	
	
	def update_password
		@user = User.find(params[:user_id])
		
		if params[:session][:password1] == params[:session][:password2]
		
			@user.encrypt_new_password(params[:session][:password1])
	      	flash.now[:notice] = "Your Password was successfully changed."
	        render 'new'
	    else
	    	flash.now[:error] = "Your Passwords are not equal."
	        render 'change_password'    
	    end    
	end	
		
		


	  
    
end
