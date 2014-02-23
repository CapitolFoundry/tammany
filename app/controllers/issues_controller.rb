class IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def show
    @issue = Issue.includes(:issue_updates).find(params[:id])
  end

  def new
    @issue = Issue.new
    @constituent = Constituent.new
  end

  def create
    @constituent = Constituent.create(params[:issue][:constituent])
    
    @issue = Issue.new(params[:issue].reject{ |k,v| k == 'constituent' })
    @issue.constituent = @constituent
    @issue.caseworker = current_caseworker
    
    if @issue.save
      flash[:notice] = "New Issue Created"
      redirect_to :index
    else
      flash[:error] = "There was a problem, try again"
      redirect_to :new
    end
    
  end

  def edit
    @issue = Issue.find(params[:id])
    @issue_update = IssueUpdate.new
  end

  def update
    @issue = Issue.find(params[:id])
    @issue.update_attributes(params[:issue].reject{ |k,v| k == 'issue_update' })
    @issue_update = IssueUpdate.create(issue: @issure, note: params[:issue][:issue_update][:note])
  end
end
