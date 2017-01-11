class ResumesController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job_id = @job
    @resume.user_id = current_user

    if @resume.save
      redirect_to job_path(@job)
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def delete
  end

  private
   def resume_params
     params.require(:resume).permit( :content )
   end

end
