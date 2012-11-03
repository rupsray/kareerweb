class ResumesController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => "upload_file"

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = Resume.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
    @resume = Resume.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /resumes/new
  # GET /resumes/new.json
  def new
    @resume = Resume.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /resumes/1/edit
  def edit
    @resume = Resume.find(params[:id])
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = Resume.new(params[:resume])

      if @resume.save
        flash[:notice] = 'Resume was successfully created.'
        redirect_to @resume
      else
        render :file => "/resumes/new"
      end
  end

  # PUT /resumes/1
  # PUT /resumes/1.json
  def update
    @resume = Resume.find(params[:id])
    
    if @resume.update_attributes(params[:resume])
      logger.info"UPDATED"
      flash[:notice] = 'Resume was successfully updated.'
      redirect_to("/resumes/profile/#{current_user.id}")
    else
      render :file => "/resumes/edit"
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy

    respond_to do |format|
      format.html { redirect_to resumes_url }
      format.json { head :no_content }
    end
  end

  def profile
    logger.info"PROFILE"
    @resume = current_user.resume
    @skills = current_user.skills
    @academics = current_user.academics
  end

  def upload_file
    logger.info"UPLOAD PARAMS #{params.inspect}"
    tempfile = params[:upload].tempfile
    original_filename = params[:upload].original_filename
    upload_path = "public/resumes/#{current_user.id}/"
    FileUtils.mkdir_p(upload_path)
    path = upload_path + original_filename
    FileUtils.cp tempfile.path, path
    resume = Resume.new
    resume.name = "Surupa"
    resume.phone_number = "9032652151".to_i
    resume.experience = 3
    resume.user_id = current_user.id
    if resume.save
      flash[:notice] = "File uploaded successfully"
      redirect_to("/resumes/profile/#{current_user.id}")
    else
      FileUtils.rm_r path
      flash[:notice] = "Please upload a proper file"
      redirect_to("/resumes/profile/#{current_user.id}")
    end
  end
end
