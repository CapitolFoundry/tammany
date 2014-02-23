class IssuesController < ApplicationController
  def index
    @issues = Issues.all
  end

  def show
    @issue = Issue.includes(:issue_update).find(params[:id])
  end

  def new
    @issue = Issue.new
    @constituent = Constituent.new
  end

  def create
    @constituent = Constituent.create(params[:issue][:constituent])
    @issue = Issue.new(
      constituent: @constituent,
      date: params[:issue][:date],
      location: params[:issue][:ad]
    )
    @issue.constituent = @constituent
    
    @issue.save
  end

  def edit
  end

  def update
  end
end
