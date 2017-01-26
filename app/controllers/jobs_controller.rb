class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :validate_search_key, only: [:search]

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
      redirect_to jobs_path
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This job already archieved"
      redirect_to jobs_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "Delete success"
    redirect_to jobs_path
  end

  def search
      @query = @query_string

      if @query_string.present?
        # search_result = Job.ransack(@search_criteria).result(distinct: true)
        search_result = Job.published.ransack({:title_or_city_or_location_or_field_cont => @query_string}).result(distinct: true)
        # search_result = Job.ransack({{:title_or_field_or_location_or_company_name_cont => @q}}).result(distinct: true)
        @jobs = case params[:order]
        when 'by_lower_bound'
          search_result.published.order('wage_lower_bound DESC').paginate(page: params[:page], per_page:5)
        when 'by_upper_bound'
          search_result.published.order('wage_upper_bound DESC').paginate(page: params[:page], per_page:5)
        when 'by_require_time'
          search_result.published.order('require_time DESC').paginate(page: params[:page], per_page:5)
        else
          search_result.published.recent.paginate(page: params[:page], per_page:5)
        end
        # @jobs = search_result.recent.paginate(page: params[:page], per_page:5)
      else
        # @jobs = Job.published.recent.paginate(page: params[:page], per_page:5)
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
  end


  protected
   def validate_search_key
    @query_string = params[:query_string].gsub(/\\|\'|\/|\?/, '') if params[:query_string].present?
  end

  def search_criteria(query_string)
    { title_or_description_or_answers_content_cont: query_string }
  end

  private
   def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden, :city, :location, :field, :require_time,)
    # params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
   end



end
