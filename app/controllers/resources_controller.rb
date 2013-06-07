class ResourcesController < ApplicationController
  respond_to :html, :json

  def index
    respond_with( @resources = Resource.all )
  end

  def show
    respond_with( @resource = Resource.find(params[:id]) )
  end

  def new
    respond_with( @resource = Resource.new(title: "", host: "", url: "", domain: "") )
  end

  def edit
    respond_with( @resource = Resource.find(params[:id]) )
  end

  def create
    normalized_params = Resource.normalize_additional_fields(params[:resource])
    @resource = Resource.new(normalized_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @resource = Resource.find(params[:id])
    normalized_params = Resource.normalize_additional_fields(params[:resource])

    respond_to do |format|
      if @resource.update_attributes(normalized_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end

  def delete_optional_attribute
    @resource = Resource.find(params[:id])
    @resource.remove_attribute(params[:optional])
    @resource.save
    redirect_to @resource, notice: 'Attribute was successfully removed.'
  end
end
