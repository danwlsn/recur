class Option < ActiveRecord::Base

	belongs_to :user

	validates :weight, presence: true

end
