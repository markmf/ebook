class Sale < ApplicationRecord
	belongs_to :book


	private

		def populate_uuid
			self.uuid  = SecureRandom.uuid()
		end
	
end
