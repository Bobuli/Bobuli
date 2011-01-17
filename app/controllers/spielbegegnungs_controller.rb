class SpielbegegnungsController < ApplicationController
  # GET /spielbegegnungs
  # GET /spielbegegnungs.xml
  def index
    @spielbegegnungs = Spielbegegnung.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spielbegegnungs }
    end
  end

  # GET /spielbegegnungs/1
  # GET /spielbegegnungs/1.xml
  def show
    @spielbegegnung = Spielbegegnung.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spielbegegnung }
    end
  end

  # GET /spielbegegnungs/new
  # GET /spielbegegnungs/new.xml
  def new
    @spielbegegnung = Spielbegegnung.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spielbegegnung }
    end
  end

  # GET /spielbegegnungs/1/edit
  def edit
    @spielbegegnung = Spielbegegnung.find(params[:id])
  end

  # POST /spielbegegnungs
  # POST /spielbegegnungs.xml
  def create
    @spielbegegnung = Spielbegegnung.new(params[:spielbegegnung])

    respond_to do |format|
      if @spielbegegnung.save
        format.html { redirect_to(@spielbegegnung, :notice => 'Spielbegegnung was successfully created.') }
        format.xml  { render :xml => @spielbegegnung, :status => :created, :location => @spielbegegnung }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spielbegegnung.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spielbegegnungs/1
  # PUT /spielbegegnungs/1.xml
  def update
    @spielbegegnung = Spielbegegnung.find(params[:id])

    respond_to do |format|
      if @spielbegegnung.update_attributes(params[:spielbegegnung])
        format.html { redirect_to(@spielbegegnung, :notice => 'Spielbegegnung was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spielbegegnung.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spielbegegnungs/1
  # DELETE /spielbegegnungs/1.xml
  def destroy
    @spielbegegnung = Spielbegegnung.find(params[:id])
    @spielbegegnung.destroy

    respond_to do |format|
      format.html { redirect_to(spielbegegnungs_url) }
      format.xml  { head :ok }
    end
  end
end
