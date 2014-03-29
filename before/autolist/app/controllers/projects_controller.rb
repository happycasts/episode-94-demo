class ProjectsController < ApplicationController
  before_action :find_project, :only => [:show, :add_collaborator, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @collaborators = @project.collaborators
  end

  def add_collaborator
    @collaborator = User.find_by_name(params[:collab])
    if @collaborator.blank?
      redirect_to @project, :notice => "User does not exist!"
    elsif @project.collaborators.include?(@collaborator)
      redirect_to @project, :notice => "User is already a collaborator!"
    else
      @project.collaborators << @collaborator
      redirect_to @project
    end
  end

  def destroy
    @collaborator = User.find_by_name(params[:collab])
    @project.collaborators.delete(@collaborator)
    redirect_to @project, :notice => "User was deleted successfully!"
  end

  private
  def find_project
    @project = Project.find_by_id(params[:id])
  end
end
