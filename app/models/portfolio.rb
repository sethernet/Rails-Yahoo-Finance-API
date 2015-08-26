class Portfolio < ActiveRecord::Base
	
	has_many :items
	has_many :stocks, :through => :items
	belongs_to :user
	
end
