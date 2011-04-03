class TippsController < ApplicationController



  # GET /tipps
  # GET /tipps.xml
  def index
    @spielbegegnungs = Spielbegegnung.all
    @tipps_user = current_tippgemeinschaft.tipps.where(:owner => current_user.name)
		
	@tipped_sps = []
	@tipps_user.each do |tipp|
		@tipped_sps << tipp.spielbegegnung
	end

	@spielbegegnungs.each do |sp|
		if !@tipped_sps.include?(sp)
			t = Tipp.new
			t.owner = current_user.name
			sp.tipps<< t
			current_tippgemeinschaft.tipps << t
			t.save
		end
	end

    @tipps_user = current_tippgemeinschaft.tipps.where(:owner => current_user.name)
	@tipps = @tipps_user
	
	@tipped_sps = []
	@tipps_user.each do |tipp|
		@tipped_sps << tipp.spielbegegnung
	end



    respond_to do |format|
      format.html { }
      format.xml  { render :xml => @tipps }
    end
  end


  # GET /tipps/new
  # GET /tipps/new.xml
  def new
    @tipp = Tipp.new
    respond_to do |format|
      
      format.html  do # new.html.erb
        @spielbegegnungs = Spielbegegnung.all
        @spielbegegnung = Spielbegegnung.find(params[:id])
        @spielbegegnung.tipps << @tipp
        
        @tg = current_tippgemeinschaft
        @tg.tipps << @tipp
      end
      format.xml  { render :xml => @tipp }
    end
  end











########################################################################################
# 	 					Do not customize these functions 							   #
########################################################################################


  # DELETE /tipps/1
  # DELETE /tipps/1.xml
  def destroy
    @tipp = Tipp.find(params[:id])
    @tipp.destroy

    respond_to do |format|
      format.html { redirect_to(tipps_url) }
      format.xml  { head :ok }
    end
  end


  # GET /tipps/1/edit
  def edit
    @tipp = Tipp.find(params[:id])
  end



  # GET /tipps/1
  # GET /tipps/1.xml
  def show
    @tipp = Tipp.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipp }
    end
  end
  
  
  
    # POST /tipps
  # POST /tipps.xml
  def create
    @tipp = Tipp.new(params[:tipp])
 	@tipp.owner = current_user.name
    respond_to do |format|
      if @tipp.save
        format.html { redirect_to(current_user, :notice => 'Tipp was successfully created.') }
        format.xml  { render :xml => @tipp, :status => :created, :location => @tipp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipp.errors, :status => :unprocessable_entity }
      end
    end
  end




  # PUT /tipps/1
  # PUT /tipps/1.xml
  def update
    @tipp = Tipp.find(params[:id])
	@tipp.owner = current_user.name
    respond_to do |format|
      if @tipp.update_attributes(params[:tipp])
        #format.html { redirect_to(@tipp, :notice => 'Tipp was successfully updated.') }
        format.html { redirect_to(tipps_url)}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipp.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
end