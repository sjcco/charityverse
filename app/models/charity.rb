class Charity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0.001 }
end
