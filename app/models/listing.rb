class Listing < ApplicationRecord
  belongs_to :user

  validates :zipcode, presence: true, length: { maximum: 5, minimum: 5 }, numericality: { only_integer: true }
end
