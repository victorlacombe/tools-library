class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tool = Tool.find(params[:id])
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    @tool = Tool.find(params[:id])
    @tag.tool_id = @tool.id
    if @tag.save
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
