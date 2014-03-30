class FitnessLog < ActiveRecord::Base

	validates :activity, presence: true
	validates :type, presence: true
	validates :time, presence: true, numericality: true
	validates :reps, presence: true, numericality: true
	validates :sets, presence: true, numericality: true
	validates :weight, presence: true, numericality: true

	self.inheritance_column = nil

	belongs_to :user

end
