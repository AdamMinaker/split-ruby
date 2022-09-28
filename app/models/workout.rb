class Workout < ApplicationRecord
  validates :name, presence: true
  has_many :exercises, :dependent => :destroy
  paginates_per 8
end
