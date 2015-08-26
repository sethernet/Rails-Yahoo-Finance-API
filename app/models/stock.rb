class Stock < ActiveRecord::Base
	
	has_many :items
	has_many :portfolios, :through => :items

end