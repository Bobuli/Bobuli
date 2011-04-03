class UserTippgemeinschaftsController < ApplicationController
  # GET /user_tippgemeinschafts
  # GET /user_tippgemeinschafts.xml
  def index
    @user_tippgemeinschafts = UserTippgemeinschaft.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_tippgemeinschafts }
    end
  end

  # GET /user_tippgemeinschafts/1
  # GET /user_tippgemeinschafts/1.xml
  def show
    @user_tippgemeinschaft = UserTippgemeinschaft.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_tippgemeinschaft }
    end
  end

  # GET /user_tippgemeinschafts/new
  # GET /user_tippgemeinschafts/new.xml
  def new
    @user_tippgemeinschaft = UserTippgemeinschaft.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_tippgemeinschaft }
    end
  end

  # GET /user_tippgemeinschafts/1/edit
  def edit
    @user_tippgemeinschaft = UserTippgemeinschaft.find(params[:id])
  end

  # POST /user_tippgemeinschafts
  # POST /user_tippgemeinschafts.xml
  def create
    @user_tippgemeinschaft = UserTippgemeinschaft.new(params[:user_tippgemeinschaft])
	

    respond_to do |format|
      if @user_tippgemeinschaft.save
        format.html { redirect_to(@user_tippgemeinschaft, :notice => 'User tippgemeinschaft was successfully created.') }
        format.xml  { render :xml => @user_tippgemeinschaft, :status => :created, :location => @user_tippgemeinschaft }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_tippgemeinschaft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_tippgemeinschafts/1
  # PUT /user_tippgemeinschafts/1.xml
  def update
    @user_tippgemeinschaft = UserTippgemeinschaft.find(params[:id])

    respond_to do |format|
      if @user_tippgemeinschaft.update_attributes(params[:user_tippgemeinschaft])
        format.html { redirect_to(@user_tippgemeinschaft, :notice => 'User tippgemeinschaft was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_tippgemeinschaft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_tippgemeinschafts/1
  # DELETE /user_tippgemeinschafts/1.xml
  def destroy
    @user_tippgemeinschaft = UserTippgemeinschaft.find(params[:id])
    @user_tippgemeinschaft.destroy

    respond_to do |format|
      format.html { redirect_to(user_tippgemeinschafts_url) }
      format.xml  { head :ok }
    end
  end
end
