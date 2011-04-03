module SessionsHelper
  
  
   def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
   
  end
  
   def setTippgemeinschaft(tippgemeinschaft)
  	 cookies.permanent.signed[:remember_token_tg] = [tippgemeinschaft.id]
  	 self.current_tippgemeinschaft = tippgemeinschaft
   end
	  
   def current_user=(user)
    @current_user = user
  end

   def current_tippgemeinschaft=(tippgemeinschaft)
    @current_tippgemeinschaft = tippgemeinschaft
  end
  
  def current_tippgemeinschaft
    @current_tippgemeinschaft ||= tg_from_remember_token
    @current_tippgemeinschaft.first
  end

  
  def current_user
    @current_user ||= user_from_remember_token
  end


  def signed_in?
    !current_user.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end


  def admin?
    !current_user.admin.nil?
  end



  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

	def tg_from_remember_token
      Tippgemeinschaft.find(cookies.signed[:remember_token_tg])
    end


    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
  
  
  
end
