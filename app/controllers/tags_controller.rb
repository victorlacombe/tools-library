class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.tool_id = params[:id]
    if @tag.save
      redirect tool_path(@tag.tool_id)
    else

    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :tool_id)
  end
end
