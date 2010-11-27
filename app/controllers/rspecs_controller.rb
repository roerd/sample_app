class RspecsController < ApplicationController
  # GET /rspecs
  # GET /rspecs.xml
  def index
    @rspecs = Rspec.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rspecs }
    end
  end

  # GET /rspecs/1
  # GET /rspecs/1.xml
  def show
    @rspec = Rspec.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rspec }
    end
  end

  # GET /rspecs/new
  # GET /rspecs/new.xml
  def new
    @rspec = Rspec.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rspec }
    end
  end

  # GET /rspecs/1/edit
  def edit
    @rspec = Rspec.find(params[:id])
  end

  # POST /rspecs
  # POST /rspecs.xml
  def create
    @rspec = Rspec.new(params[:rspec])

    respond_to do |format|
      if @rspec.save
        format.html { redirect_to(@rspec, :notice => 'Rspec was successfully created.') }
        format.xml  { render :xml => @rspec, :status => :created, :location => @rspec }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rspec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rspecs/1
  # PUT /rspecs/1.xml
  def update
    @rspec = Rspec.find(params[:id])

    respond_to do |format|
      if @rspec.update_attributes(params[:rspec])
        format.html { redirect_to(@rspec, :notice => 'Rspec was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rspec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rspecs/1
  # DELETE /rspecs/1.xml
  def destroy
    @rspec = Rspec.find(params[:id])
    @rspec.destroy

    respond_to do |format|
      format.html { redirect_to(rspecs_url) }
      format.xml  { head :ok }
    end
  end
end
