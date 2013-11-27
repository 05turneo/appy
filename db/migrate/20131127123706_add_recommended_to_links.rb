class AddRecommendedToLinks < ActiveRecord::Migration
  
	# Add a column to the links table
  def change
  	add_column :links, :is_recommended, :boolean, default: false

  	# rename column :links, :name, :title
  	# remove column :links, :name
  end
end
