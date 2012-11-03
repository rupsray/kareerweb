class SkillsController < ApplicationController
  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
    @skill = Skill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /skills/new
  # GET /skills/new.json
  def new
    @skill = Skill.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /skills/1/edit
  def edit
    @skill = Skill.find(params[:id])
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(params[:skill])

    if @skill.save
      flash[:notice] = 'Skill was successfully created.'
      redirect_to(@skill)
    else
      render :file => "/skills/new"
    end
  end

  # PUT /skills/1
  # PUT /skills/1.json
  def update
    @skill = Skill.find(params[:id])

    if @skill.update_attributes(params[:skill])
      flash[:notice] = 'Skill was successfully updated.'
      redirect_to(@skill)
    else
      render :file => "edit"
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to skills_url }
      format.json { head :no_content }
    end
  end
end