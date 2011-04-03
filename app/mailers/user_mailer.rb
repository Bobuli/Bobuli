class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  
  def registration_confirmation(user)
  	@user = user
  	mail(:to => user.email, :subject => "Registration", :from => "bot.bobuli@googlemail.com")
  end
  
  def group_invitation(user_src, user_dest, tippgemeinschaft, text)
  	@user_src = user_src
  	@user_dest = user_dest
  	@tippgemeinschaft = tippgemeinschaft
  	@text = text
  	mail(:to => user_dest.email, :subject => "Gruppen-Einladung", :from => "benni.bischke@gmx.de")
  	
  end
  
  
  def reset_password(user)
  	@user = user
  	mail(:to => user.email, :subject => "Passwort vergessen", :from => "benni.bischke@gmx.de")
  end
  
  
  
end
