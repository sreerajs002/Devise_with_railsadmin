class Area < ActiveRecord::Base
	validates :name,:rating, presence:true
	has_many :list, dependent: :destroy
	def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
