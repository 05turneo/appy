class Link < ActiveRecord::Base
	#link up this model with the category
	belongs_to :category


	validates :name, presence: true
	validates :url, presence: true, uniqueness:true
end
