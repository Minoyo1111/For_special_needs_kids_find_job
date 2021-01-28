class Admin::JobsController < ApplicationController
  def show
    @job = Job.find_by(params[:id])
  end

  def index 
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:id])
    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find_by(params[:id])
  end

  def update
    @job = Job.find_by(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find_by(params[:id])
    @job.destroy if @job
    redirect_to admin_jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :store_name, :contact_phone, :area, :description, :lunch, :pay)
  end
  def require_is_admin
    if current_user.email != 'dd@dd.dd'
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end
  
end
