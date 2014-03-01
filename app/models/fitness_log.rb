class FitnessLog < ActiveRecord::Base

	validates :activity, presence: true
	validates :time, presence: true
	validates :reps, presence: true
	validates :sets, presence: true
	validates :weight, presence: true

	self.inheritance_column = nil

	belongs_to :user

end
