class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_caseworker!
  
  def after_sign_in_path_for(caseworker)
    page_confirm_path
  end
  
end

class SessionsController < ApplicationController
  skip_before_filter :authenticate_caseworker!
end

class PageController < ApplicationController
  skip_before_filter :authenticate_caseworker!, :only => [:home]
end