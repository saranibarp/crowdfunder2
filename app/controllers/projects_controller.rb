class ProjectsController < ApplicationController
  def index
    @projects = Project.order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    @pledge = Pledge.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: 'Project created!!'
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end