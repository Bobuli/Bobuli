class TippgemeinschaftsController < ApplicationController
  # GET /tippgemeinschafts
  # GET /tippgemeinschafts.xml
  def index
    @tippgemeinschafts = Tippgemeinschaft.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tippgemeinschafts }
    end
  end

  # GET /tippgemeinschafts/1
  # GET /tippgemeinschafts/1.xml
  def show
    @tippgemeinschaft = Tippgemeinschaft.find(params[:id])
    @spielbegegnung = Spielbegegnung.find(1);


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tippgemeinschaft }
    end
  end

  # GET /tippgemeinschafts/new
  # GET /tippgemeinschafts/new.xml
  def new
    @tippgemeinschaft = Tippgemeinschaft.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tippgemeinschaft }
    end
  end

  # GET /tippgemeinschafts/1/edit
  def edit
    @tippgemeinschaft = Tippgemeinschaft.find(params[:id])
  end

  # POST /tippgemeinschafts
  # POST /tippgemeinschafts.xml
  def create
    @tippgemeinschaft = Tippgemeinschaft.new(params[:tippgemeinschaft])

    respond_to do |format|
      if @tippgemeinschaft.save
        format.html { redirect_to(@tippgemeinschaft, :notice => 'Tippgemeinschaft was successfully created.') }
        format.xml  { render :xml => @tippgemeinschaft, :status => :created, :location => @tippgemeinschaft }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tippgemeinschaft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tippgemeinschafts/1
  # PUT /tippgemeinschafts/1.xml
  def update
    @tippgemeinschaft = Tippgemeinschaft.find(params[:id])

    respond_to do |format|
      if @tippgemeinschaft.update_attributes(params[:tippgemeinschaft])
        format.html { redirect_to(@tippgemeinschaft, :notice => 'Tippgemeinschaft was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tippgemeinschaft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tippgemeinschafts/1
  # DELETE /tippgemeinschafts/1.xml
  def destroy
    @tippgemeinschaft = Tippgemeinschaft.find(params[:id])
    @tippgemeinschaft.destroy

    respond_to do |format|
      format.html { redirect_to(tippgemeinschafts_url) }
      format.xml  { head :ok }
    end
  end  
  
  
end
