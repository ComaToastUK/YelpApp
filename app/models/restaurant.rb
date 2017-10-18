class Restaurant < ApplicationRecord

  has_many :comments, dependent: :destroy
  validates :name, presence: true, length: { minimum: 5 }
  validates :location, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 5}

end
