class CaseworkersController < ApplicationController
  def index
    @caseworkers = Caseworker.all
  end

  def show
    @caseworker = Caseworker.find(params[:id])
  end
end
