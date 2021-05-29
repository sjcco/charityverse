class User < ApplicationRecord
  has_many :groups
  has_many :charities, as: :author

  validates :name, presence: true, uniqueness: true
end
