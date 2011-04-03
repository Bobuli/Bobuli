ActionMailer::Base.smtp_settings = {
##  :address  => "mail.gmx.net",
#  :port  => 25, 
#  :domain  => "localhost",
#  :user_name  => "benni.bischke@gmx.de",
#  :password  => "langlaufski89",
#  :authentication  => :login,
#  :enable_starttls_auto => true
#}

  :address              => "smtp.gmail.com",  
  :port                 => 587,                 
  :domain               => "http://bobuli.heroku.com",  
  :user_name            => 'bot.bobuli@googlemail.com',      
  :password             => 'bobuli123456',      
  :authentication       => 'plain',             
  :enable_starttls_auto => true
}


