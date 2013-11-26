class CategoriesController < ApplicationController
	# add index page - this defines the index for the controller

	#Use before_action to do anything before method. 
	before_action :get_category, only: [:show, :edit, :update , :destroy]


	#DRY Method

	def get_category
		#category in get_category method that is run with before_action
		@category = Category.find(params[:id])
	end



	def index
		# @username = "Oli"
		# @age = 25
		# @categories = ["Design", "Rails", "Javascript", "Ruby"]
	
		@categories = Category.all.order("rank asc", "name asc")
	end

	#individual category show page
	#using the @category variable find looks for database row

	def show
		#category in get_category method that is run with before_action
	end

	#adds new category form
	def new
		@category = Category.new
	end	

	#actually create the new category based on form actions

	def create
		@category = Category.new(category_params)
		# When form validation met
		if @category.save
			flash[:success] = "New Category created"
			redirect_to root_path
		else
		# When validation not met
			render :new
			flash[:success] = "New Category not created"	
		end
	
	end

	#find the category like the show action

	def edit
		#category in get_category method that is run with before_action
	end


	# whitelist all of the form data

	def category_params
		params.require(:category).permit(:name, :rank)
	end

	#actually update the database with form data

	def update

		if @category.update(category_params)
			flash[:success] = "Category Updated"
			redirect_to root_path

		else	
			render :edit
			flash[:success] = "Category Not Updated"
		end
		#category in get_category method that is run with before_action

	end

	def destroy #find the row
		
		get_category

		#destroy the row
		@category.destroy

		#flash message
		flash[:success] = "Category deleted"
		
		#redirect
		redirect_to root_path

	end

end

