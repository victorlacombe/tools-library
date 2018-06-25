class ToolsController < ApplicationController

  def index
    @tools = Tool.all.order(:id)
    @tool = Tool.new
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    @tool.update(tool_params)
    redirect_to tool_path(@tool)
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :website_url, :image_url, :chrome_extension_url)
  end

end
