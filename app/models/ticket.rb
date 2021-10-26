class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :cost, presence: true
  validates :quantities, presence: true, numericality: { only_integer: true }
  validates :quantities, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
