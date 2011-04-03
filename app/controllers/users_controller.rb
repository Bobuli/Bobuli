class UsersController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  
  skip_filter :enforce_authentication, :only => [:new, :create, :activate_account]
  
  
  
  # This is for sorting, pagniation and searching 	
  # GET /users
  # GET /users.xml
  def index
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 7, 
    																 :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.js # index.js.erb 
    end
  end



  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @tipps = current_tippgemeinschaft.tipps

    respond_to do |format|
      format.html  #show.html.erb
      format.xml  { render :xml => @user }
    end
  end



  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @tippgemeinschaft = Tippgemeinschaft.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end



  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end


  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

	# DELETE /users/1
	# DELETE /users/1.xml
	def destroy
	  @user = User.find(params[:id])
	  @user.destroy
	  respond_to do |format|
	    format.html { redirect_to(users_url) }
	    format.xml  { head :ok }
	  end
	end




#################################################################################################  
#		CUSTOMIZED
#################################################################################################  

  # POST /users
  # POST /users.xml
  def create
  	@user = User.new(params[:user])
    @tippgemeinschaft = Tippgemeinschaft.new(:name => params[:user][:name])
    
    @user.active = false
    @user.validation_key =  Digest::SHA1.hexdigest("#{Time.now}")
    
    respond_to do |format|
      if @user.save && @tippgemeinschaft.save
      	UserMailer.registration_confirmation(@user).deliver
      	
        format.html { flash[:notice] = 'Your Account was successfully created.'
        			  redirect_to(signin_url) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
    @user.tippgemeinschafts << @tippgemeinschaft
  end




  
#################################################################################################  
# 					SPECIAL FUNCTIONALITY 
#################################################################################################  
	
	def users_for_lookup
		@users = User.find(:all)
		@headers['content-type'] = 'text/javascript'
		render :layout => false
	end  

  
	# GET /users/1/inviteToGroup
	def inviteToGroup
	@user = User.find(params[:id])
	  
	respond_to do |format|
		
		if current_tippgemeinschaft.name == current_user.name
			format.html { flash[:notice] = 'Du befindest dich derzeit im Einzelspielermodus. Waehle bitte eine andere Tippgemeinschaft aus.' 
					   redirect_to(users_url)}
			format.xml  { head :ok }
		else
			format.html
		end
		
	  end
	end
  

  # POST /users/1/invite
  	def invite
  		
 	  @tippgemeinschaft = current_tippgemeinschaft
	  @user = User.find(params[:id])
  	  UserMailer.group_invitation(current_user, @user, @tippgemeinschaft, params[:comment]).deliver
 	  respond_to do |format|
	      format.html { flash[:notice] = 'Der Spieler ' + @user.name + ' wurde jetzt eingeladen.'
        			    redirect_to(users_url)}
	      format.xml  { head :ok }
      end	
  	end 	

  


  def activate_account
  	@user = User.find_by_validation_key(params[:key])
    
    respond_to do |format|
      if !@user.nil?
      	
      	@user.active = true
      	@user.validation_key = nil
      	
        # ensure the key can not be re-used
        @user.save
        format.html { flash[:notice] = 'Your Account was successfully activated.'
        			  redirect_to(signin_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end


  def activate_tippgemeinschaft
  	key = params[:key]
  	@tippgemeinschaft = Tippgemeinschaft.find_by_group_key(key)
    
    respond_to do |format|
      if !@tippgemeinschaft.nil? !@tippgemeinschaft.users.include?(current_user)
      	
      	@tippgemeinschaft.users << current_user
      	format.html { flash[:notice] = 'You joined the new group successfully'
        			  redirect_to(@tippgemeinschaft) }
        format.xml  { head :ok }
      else
        format.html { flash[:notice] = 'Du bist bereits in der Tippgemeinschaft'
        			  redirect_to(@tippgemeinschaft) }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end		

  
  
  
  
  
  
  
  
  
  
  
  
  
##################################################################################################  
#  				PRIVATE FUNCTIONS
##################################################################################################  
  private
  
  def sort_column
  	User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  
  def sort_direction
  	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  
  
end
