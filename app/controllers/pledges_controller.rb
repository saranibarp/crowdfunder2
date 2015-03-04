class PledgesController < ApplicationController
  before_action :lookup_project

  def new
    @pledge = @project.pledges.new
  end

  def create
    @pledge = @project.pledges.new(pledge_params)
    @pledge.fetch_funding_level(@project)

    if @pledge.save
      redirect_to project_path(@project), notice: 'Pledge added!!'
    else
      render 'new'
    end
  end

  private

  def lookup_project
    @project = Project.find(params[:project_id])
  end

  def pledge_params
    params.require(:pledge).permit(:name, :email, :amount)
  end
end
