class ResumesController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

end
