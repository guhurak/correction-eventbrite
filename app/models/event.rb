class Event < ApplicationRecord
	belongs_to :user
	has_many :attendances
	has_many :users, through: :attendances
	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :location, presence: true
	validate :duration_mutliple_of_5

	def duration_mutliple_of_5
		@duration = self.duration
		if @duration != nil
			errors.add(:duration, "Doit être un multiple de 5") unless @duration % 5 == 0
		else
			errors.add(:duration, "doit être rempli")
		end
	end

	def end_date
		end_date = Time.at(self.start_date.to_i + (self.duration * 60))
	end
end
