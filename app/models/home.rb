class Home < ActiveRecord::Base
	belongs_to :seller
	validates_presence_of :neighborhood
	validates :square_footage, numericality: { only_integer: true, 
																						 greater_than_or_equal_to: 0 }

	has_one :address
end