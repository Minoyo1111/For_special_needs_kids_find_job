class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_job, only: [:show, :edit, :update, :destroy]
  before_action :require_is_admin

  def show
  end

  def index 
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job.destroy if @job
    redirect_to admin_jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :store_name, :contact_phone, :area, :description, :lunch, :pay, :contact_email, :is_hidden)
  end
  def find_job
    @job = Job.find_by(id: params[:id])
  end
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = '抱歉，你沒有權限進來'
      redirect_to root_path
    end
  end
  
end
