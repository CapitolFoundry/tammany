class PageController < ApplicationController
  def home
  	redirect_to page_dashboard_path if current_caseworker
  end
  
  def confirm
  end

  def dashboard
  	@issues = Issue.all
  end
end
