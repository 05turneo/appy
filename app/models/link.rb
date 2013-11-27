class Link < ActiveRecord::Base
	#link up this model with the category
	belongs_to :category


	validates :name, presence: true
	validates :url, presence: true, uniqueness:true

	# This method removes the Http from the url
	def sexy_urls
		url.gsub("http://", "").gsub("www.", "")


	end





end


