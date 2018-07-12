class ToolsController < ApplicationController

  def index
    # needed for the modal form (create a new tool)
    @tool = Tool.new
     if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @tools = Tool.where(sql_query, query: "%#{params[:query]}%")
    else
      @tools = Tool.all.order(:id)
    end
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

      # ------ Enriching the creacted tool with Clearbit API ------

      # Name
      if @tool.clearbit_enrichment["name"].nil?
        @tool.update(name: @tool.clearbit_enrichment["domain"])
      else
        @tool.update(name: @tool.clearbit_enrichment["name"])
      end

      # Tags
      # @tool.update(tagline: @tool.clearbit_enrichment["tags"])

      # Description
      if @tool.clearbit_enrichment["description"].nil?
        @tool.update(description: @tool.clearbit_enrichment["domain"])
      else
        @tool.update(description: @tool.clearbit_enrichment["description"])
      end

      # Image URL
      if @tool.clearbit_enrichment["logo"].nil?
        @tool.update(image_url: "no_logo_logo.png")
      else
        @tool.update(image_url: @tool.clearbit_enrichment["logo"])
      end

      # ------ Redirecting to the tool that was created -------
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
    params.require(:tool).permit(:website_url)
  end
end
