class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new
  end
end
