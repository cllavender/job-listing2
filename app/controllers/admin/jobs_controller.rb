class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :require_is_admin

  layout "admin"

  def index
    #@jobs = Job.published.order('created_at DESC')
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.published.order('wage_lower_bound DESC').paginate(page: params[:page], per_page:5)
    when 'by_upper_bound'
      Job.published.order('wage_upper_bound DESC').paginate(page: params[:page], per_page:5)
    when 'by_require_time'
      Job.published.order('require_time DESC').paginate(page: params[:page], per_page:5)
    else
      Job.published.recent.paginate(page: params[:page], per_page:5)
    end
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

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "Delete success"
    redirect_to admin_jobs_path
  end

  def hide
    @job = Job.find(params[:id])
    @job.job_hide!

    redirect_to :back
  end

  def publish
    @job = Job.find(params[:id])
    @job.job_publish!

    redirect_to :back
  end


  private
   def job_params
     params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
   end
end
