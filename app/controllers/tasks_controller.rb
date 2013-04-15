class TasksController < ApplicationController
  respond_to :html, :js

  before_filter :authenticate_user!

  def index
    @project = Project.find(params[:project_id])
    @tasks = current_user.projects.find(params[:project_id]).tasks

    respond_with @tasks
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new

    respond_with @task
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(params[:task])

    if @task.save
      flash[:success] = 'Task has been created successfully'
    end

    respond_with [@project, @task]
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    return permission_denied if !current_user.projects.include?(@project)

    respond_with [@project, @task]
  end

  def update
    @project = Project.find(params[:project_id])
    return permission_denied if !current_user.projects.include?(@project)
    
    @task = @project.tasks.find(params[:id])

    if @task.update_attributes(params[:task])
      flash[:success] = 'Task has been edited successfully'
    end

    redirect_to :back
  end

  def destroy
    @project = Project.find(params[:project_id])
    return permission_denied if !current_user.projects.include?(@project)

    @task = @project.tasks.find(params[:id])

    @task.destroy
    flash[:success] = 'Task has been destroyed succesfully'

    redirect_to :back
  end

  def show
    @project = Project.find(params[:project_id])
    return permission_denied if !current_user.projects.include?(@project)

    @task = @project.tasks.find(params[:id])
    @work_interval = @task.work_intervals.where(end_date: nil).last

    respond_with [@project, @task]
  end
end
