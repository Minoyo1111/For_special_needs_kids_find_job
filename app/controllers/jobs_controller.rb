class JobsController < ApplicationController
  before_action :find_job, only: [:edit, :update, :destroy]
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path, notice: "職缺已新增"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: "職缺已更新"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy if @job
    redirect_to jobs_path, notice: "職缺已刪除"
  end

  private
    def job_params
      params.require(:job).permit(:title, :store_name, :contact_phone, :area, :description, :lunch, :pay)
    end

    def find_job
      @job = Job.find_by(id: params[:id])
    end
  end