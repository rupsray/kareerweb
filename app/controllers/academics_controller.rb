class AcademicsController < ApplicationController
  # GET /academics
  # GET /academics.json
  def index
    @academics = Academic.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /academics/1
  # GET /academics/1.json
  def show
    @academic = Academic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /academics/new
  # GET /academics/new.json
  def new
    @academic = Academic.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /academics/1/edit
  def edit
    @academic = Academic.find(params[:id])
  end

  # POST /academics
  # POST /academics.json
  def create
    @academic = Academic.new(params[:academic])

    respond_to do |format|
      if @academic.save
        redirect_to(@academic)
        flash[:notice] = 'Academic was successfully created.'
      else
        render :file => "/academics/new"
      end
    end
  end

  # PUT /academics/1
  # PUT /academics/1.json
  def update
    @academic = Academic.find(params[:id])

    respond_to do |format|
      if @academic.update_attributes(params[:academic])
        redirect_to(@academic)
        flash[:notice] ='Academic was successfully updated.'
        format.json { head :no_content }
      else
        render :file => "/academics/edit"
      end
    end
  end

  # DELETE /academics/1
  # DELETE /academics/1.json
  def destroy
    @academic = Academic.find(params[:id])
    @academic.destroy

    respond_to do |format|
      format.html { redirect_to academics_url }
      format.json { head :no_content }
    end
  end
end
