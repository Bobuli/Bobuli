class ApplicationController < ActionController::Base
   
  protect_from_forgery
  include SessionsHelper    ## non_rest_authentication is Session-based
  
  
 
  before_filter :enforce_authentication
  
  
  # Enforces authentication for both ordinary requests and REST requests. For ordinary
  # requests a cookie+session based approach is used. For REST requests a HTTP Basic 
  # Authentication based approach is used.
  def enforce_authentication
    if is_rest_call?
      enforce_rest_authentication
    else
      enforce_non_rest_authentication
    end
  end
 

#/***********************************************************************************************
# * PROTECTED METHODES
# ***********************************************************************************************/
  protected
 
  def enforce_rest_authentication
    authenticate_or_request_with_http_basic('Bobuli Webservice 1.0') do |name, password|
      
      user = User.authenticate(name,password)
      if user.nil?
        @current_user = user
        false
      else
        @current_user = user
		@current_tippgemeinschaft = Tippgemeinschaft.find_by_name(@current_user.name.to_s)
		true
      end
    end  
  end
 
 
 
  def enforce_non_rest_authentication
    if !signed_in?
      respond_to do |format|
        format.html do
          redirect_to '/signin'
          #:controller => 'sessions', :action => "new"
        end  
        # second case: xml, going here must be a failure
        format.xml do
          render_rest_error "Authentication failed", :status => :error
        end
      end
    end
    true
  end
 
 
 
#/***********************************************************************************************
# * PRIVATE METHODES
# ***********************************************************************************************/
  
  private
 
  # Determines if the incoming request is a REST call (defined as a request that would
  # target respond_to :xml blocks.
 
  def is_rest_call?
    mime_type_priority = Array(Mime::Type.lookup_by_extension(request.parameters[:format]) || request.accepts)
    mime_type_priority[0].to_sym == :xml
  end
  
  
end #controller
