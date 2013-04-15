class WorkIntervalsController < ApplicationController
  respond_to :html, :js

  before_filter :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    return permission_denied if !current_user.projects.include?(@project)

    @task = @project.tasks.find(params[:task_id])
    @work_interval = @task.work_intervals.build(params[:work_interval])
    @work_interval.start_date = DateTime.now

    if @work_interval.save
      flash[:success] = 'Yes! You started working :)'
      redirect_to :back 
    end

  end

  def update
    @project = Project.find(params[:project_id])
    return permission_denied if !current_user.projects.include?(@project)
    
    @task = @project.tasks.find(params[:task_id])
    @work_interval = @task.work_intervals.find(params[:id])

    if @work_interval.update_attributes(:end_date => DateTime.now)
      flash[:success] = 'Alright, you stopped working!'
      redirect_to :back
    end

  end

end
