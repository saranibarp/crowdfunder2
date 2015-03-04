class FundingLevelsController < ApplicationController
  before_action :lookup_project

  def new
    @funding_level = @project.funding_levels.new
  end

  def create
    @funding_level = @project.funding_levels.new(funding_level_params)

    if @funding_level.save
      redirect_to project_path(@project), notice: 'Funding level added!!'
    else
      render 'new'
    end
  end

  private

  def lookup_project
    @project = Project.find(params[:project_id])
  end

  def funding_level_params
    params.require(:funding_level).permit(:reward_name, :amount)
  end
end
