class Item < ApplicationRecord
  has_one :category
  belongs_to :user
  has_one :comment
  has_one :reserve


  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :category, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }


  def self.search(term)
    if term
      where(['lower(name) LIKE ? AND availability != ? OR lower(description) LIKE ? AND availability != ?', "%#{term.downcase}%", "closed", "%#{term.downcase}%", "closed"]).order('id DESC')
    else
      where("availability != 'closed'").order('id DESC')
    end
  end

end