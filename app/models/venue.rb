class Venue < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :capacity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validate :create_event, :on => :create
  validate :create_event, :on => :update

  def create_event
    user = User.find_by("id = ?", self.user_id)
    if user.rol != "ADMINISTRADOR"
      errors.add(:message, 'Debes de ser Administrador ')
    end
  end
end
