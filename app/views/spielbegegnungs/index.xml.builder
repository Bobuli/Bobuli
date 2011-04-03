xml.instruct!
xml.spielbegegnungen do
	
	@spielbegegnungs.each do |spielbegegnung|
		xml.spielbegegnung do
			xml.spielebegegnungsid     spielbegegnung.id
	       	xml.verein_heim		Verein.find(spielbegegnung.verein_heim_id).name
	    	xml.verein_heim_id spielbegegnung.verein_heim_id
	    	xml.gast_heim		Verein.find(spielbegegnung.verein_gast_id).name
	    	xml.verein_gast_id spielbegegnung.verein_gast_id
	    	xml.tore_heim	spielbegegnung.tore_heim
	    	xml.tore_gast	spielbegegnung.tore_gast
	    	xml.tipp_tore_heim 
	    	xml.tipp_gast_heim	    	
	    end	
    end 
end