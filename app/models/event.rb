class Event < ApplicationRecord
	belongs_to :user
	has_many :attendances
	has_many :users, through: :attendances
	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :location, presence: true
	validate :duration_mutliple_of_5
	validate :is_already_passed

	def is_already_passed
		@startdate = self.start_date
		if @startdate != nil
			errors.add(:startdate, "Ne doit pas être déjà passé") unless @startdate > Time.now
		else
			errors.add(:startdate, "Doit être rempli")
		end
	end

	def duration_mutliple_of_5
		@duration = self.duration
		if @duration != nil
			errors.add(:duration, "Doit être un multiple de 5") unless @duration % 5 == 0
		else
			errors.add(:duration, "Doit être rempli")
		end
	end

	def end_date
		end_date = Time.at(self.start_date.to_i + (self.duration * 60))
	end
end
