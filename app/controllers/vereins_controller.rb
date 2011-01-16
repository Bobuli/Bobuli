class VereinsController < ApplicationController
  # GET /vereins
  # GET /vereins.xml
  def index
    @vereins = Verein.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vereins }
    end
  end

  # GET /vereins/1
  # GET /vereins/1.xml
  def show
    @verein = Verein.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @verein }
    end
  end

  # GET /vereins/new
  # GET /vereins/new.xml
  def new
    @verein = Verein.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @verein }
    end
  end

  # GET /vereins/1/edit
  def edit
    @verein = Verein.find(params[:id])
  end

  # POST /vereins
  # POST /vereins.xml
  def create
    @verein = Verein.new(params[:verein])

    respond_to do |format|
      if @verein.save
        format.html { redirect_to(@verein, :notice => 'Verein was successfully created.') }
        format.xml  { render :xml => @verein, :status => :created, :location => @verein }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @verein.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vereins/1
  # PUT /vereins/1.xml
  def update
    @verein = Verein.find(params[:id])

    respond_to do |format|
      if @verein.update_attributes(params[:verein])
        format.html { redirect_to(@verein, :notice => 'Verein was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @verein.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vereins/1
  # DELETE /vereins/1.xml
  def destroy
    @verein = Verein.find(params[:id])
    @verein.destroy

    respond_to do |format|
      format.html { redirect_to(vereins_url) }
      format.xml  { head :ok }
    end
  end
end
