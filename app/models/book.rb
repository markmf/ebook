class Book < ApplicationRecord
	belongs_to :user
	has_attached_file :image
	has_attached_file :resource

	validates_attachment :image, presence: true,
	content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
	message: 'Only images allowed.'
end
