class JobsController < ApplicationController
  #before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    @company = Company.find(params[:company_id])
    if @job.save
      #flash[:success] = "#{@company.name} updated!"
      redirect_to company_job_path(@company, @job.id)
    else
      render :edit
    end

  end

  def destroy
    job = Job.find_by(id: params[:id], company_id: params[:company_id])
    job.destroy
    company = Company.find(params[:company_id])

    redirect_to companies_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

  # def set_job
  #   @job = Job.find(params[:id])
  # end

end
