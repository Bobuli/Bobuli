class Tipp < ActiveRecord::Base
  
  belongs_to :tippgemeinschaft#, :class_name => "Tippgemeinschaft", :foreign_key => "tippgemeinschaft_id"
  belongs_to :spielbegegnung
  
end
