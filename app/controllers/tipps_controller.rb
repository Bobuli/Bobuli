class TippsController < ApplicationController
  # GET /tipps
  # GET /tipps.xml
  def index
    
#    @tipps = Tipp.all
    @tipps = current_user.tippgemeinschafts.first.tipps


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipps }
    end
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

  # GET /tipps/new
  # GET /tipps/new.xml
  def new
    @tipp = Tipp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipp }
    end
  end

  # GET /tipps/1/edit
  def edit
    @tipp = Tipp.find(params[:id])
  end

  # POST /tipps
  # POST /tipps.xml
  def create
    @tipp = Tipp.new(params[:tipp])
    @tg = current_user.tippgemeinschafts.first              #FIXME!
    @tg.tipps << @tipp
    

    respond_to do |format|
      if @tipp.save
        format.html { redirect_to(@tipp, :notice => 'Tipp was successfully created.') }
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

    respond_to do |format|
      if @tipp.update_attributes(params[:tipp])
        format.html { redirect_to(@tipp, :notice => 'Tipp was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipp.errors, :status => :unprocessable_entity }
      end
    end
  end

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
end
