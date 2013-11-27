class LinksController < ApplicationController
	# Before everything in the controller find the category
	before_action :get_category

	# Before certain actions get link
	before_action :get_link, only: [:edit, :update, :destroy]

  def new
  	#Make a clone if duplicate_id in url

  	if params[:duplicate_id].present?
  		@duplicate_link = @category.links.find(params[:duplicate_id])
  		@link = @category.links.new(@duplicate_link.attributes)

  	else
  		@link = @category.links.new
  	end

  end

  # Create the link based on form data
  def create
  	@link = @category.links.new(link_params)

  	if @link.save
  		flash[:success] = "Your link has been added"
  		redirect_to category_path(@category)

  	else
  		render :new
  	end

  end

  def edit
  end

  # actually update the database with the edited information
  def update

  	if @link.update(link_params)
  		flash[:success] = "Link updated"
  		redirect_to category_path(@category)
  	else
  		render :edit

    end

  end

  def destroy
  	@link.destroy
  	flash[:success] = "Link deleted"
  	redirect_to category_path(@category)
  	
  end


  def link_params
  	params.require(:link).permit(:name, :description, :url, :is_recommended)
  end

  # we need to find the category for the link using the /categories/:category_id/links/new
  def get_category
  		@category = Category.find(params[:category_id])
  end

  def get_link
  	@link = @category.links.find(params[:id])
  end

end
