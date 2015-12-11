class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def new
  end

  def show
  end
end
