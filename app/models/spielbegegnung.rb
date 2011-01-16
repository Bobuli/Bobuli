class Spielbegegnung < ActiveRecord::Base

belongs_to :verein_heim, :class_name => "Verein", :foreign_key => "verein_heim_id"
belongs_to :verein_gast, :class_name => "Verein", :foreign_key => "verein_gast_id"

has_many :tipps

end
