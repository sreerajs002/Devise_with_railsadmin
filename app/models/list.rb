class List < ActiveRecord::Base
	belongs_to :area
	belongs_to :category
	validates :listname, length:{minimum:4},uniqueness: true
	validates :category_id,:area_id, presence: true

	def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
  
end
