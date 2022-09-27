class Exercise < ApplicationRecord
  belongs_to :workout
  has_many :sessions, :dependent => :destroy
  validates :name, presence: true
end
