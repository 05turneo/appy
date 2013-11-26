class Category < ActiveRecord::Base
	#add links to the category

	has_many :links


	#Validations

	validates :name, presence: true, uniqueness: { message: "Name already taken", case_sensitive: false }
	validates :rank, presence: true, numericality: { greater_than: 0}


end
