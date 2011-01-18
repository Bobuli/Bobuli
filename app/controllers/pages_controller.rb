class PagesController < ApplicationController
  
  before_filter :enforce_authentication, :except => [:about, :contact]
  
  def home
  end

  def contact
  end

  def about
    
  end

end
