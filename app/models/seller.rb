class Seller < ActiveRecord::Base
	has_many :homes, dependent: :destroy

	validates_presence_of :name

end
