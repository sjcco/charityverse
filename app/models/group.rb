class Group < ApplicationRecord
  belongs_to :user
  has_many :charities

  validates :name, presence: true, uniqueness: true
end
