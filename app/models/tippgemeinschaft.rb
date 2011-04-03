class Tippgemeinschaft < ActiveRecord::Base
  
  
  has_many :tipps#, :class_name => "Tippgemeinschaft", :foreign_key => "tippgemeinschaft_id"
  has_many :user_tippgemeinschafts
  has_many :users, :through => :user_tippgemeinschafts
 
  

end
