class ProjectsController < ApplicationController
  respond_to :html, :js

  before_filter :authenticate_user!

  def index
    @projects = current_user.projects

    respond_with @projects
  end

  def new
    @project = Project.new

    respond_with @project
  end

  def create
    @user = current_user
    @project = @user.projects.build(params[:project])

    if @project.save
      flash[:success] = 'Project has been created successfully'
    end
    respond_with @project
  end

  def edit
    @project = Project.find(params[:id])
    return permission_denied if !current_user.projects.include?(@project)

    respond_with @project
  end

  def update
    @project = Project.find(params[:id])
    return permission_denied if !current_user.projects.include?(@project)

    if @project.update_attributes(params[:project])
      flash[:success] = 'Project has been edited successfully'
    end

    respond_with @project
  end

  def destroy
    @project = Project.find(params[:id])
    return permission_denied if !current_user.projects.include?(@project)

    @project.destroy
    flash[:success] = 'project has been destroyed succesfully'

    respond_with @project
  end

  def show
    @project = Project.find(params[:id])
    return permission_denied if !current_user.projects.include?(@project)

    @tasks = @project.tasks

    respond_with @project
  end
end
