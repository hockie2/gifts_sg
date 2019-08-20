class Item < ApplicationRecord
	belongs_to :category
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :category, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }
  validates :preloved, presence: true


end

