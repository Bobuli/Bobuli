class Verein < ActiveRecord::Base

has_many :occurances_as_source_language, :class_name => "Spielbegegnung", :foreign_key => "verein_heim_id"
has_many :occurances_as_target_language, :class_name => "Spielbegegnung", :foreign_key => "verein_gast_id"

end
