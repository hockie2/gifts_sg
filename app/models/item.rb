class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one :comment
  has_one :reserve
<<<<<<< HEAD

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :category, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }
  validates :preloved, presence: true

  def self.search(term)
    if term
      where(['name LIKE ? OR description LIKE ?', "%#{term}%", "%#{term}%"]).order('id DESC')
    else
      order ('id DESC')
    end
  end
=======
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :category, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }
  
>>>>>>> listing
end