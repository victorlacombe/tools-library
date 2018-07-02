class ToolsController < ApplicationController

  def index
    # needed for the modal form (create a new tool)
    @tool = Tool.new
     if params[:query].present?
      @tools = Tool.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @tools = Tool.all.order(:id)
    end
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
    @tag = Tag.new
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

  def destroy
    @tool = Tool.find(params[:id])
    @tool.delete
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :tagline, :website_url, :image_url, :chrome_extension_url)
  end
end
