class Product < ActiveRecord::Base
	belongs_to :category

	def self.search(search)
		if search
			self.all.order(:name).where(['name LIKE ?', "%#{search}%"])
		else
			self.all
		end
	end

	def category_name
		category.try(:name)
	end

	def category_name=(name)
		self.category = Category.find_or_create_by(name: name) if name.present?
	end
  
end