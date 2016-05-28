class Home < ActiveRecord::Base
	belongs_to :seller
	validates_presence_of :name


end
