class Event < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  has_many :tickets

  validates :name, presence: true
  validates :status, presence: true
  validate :create_and_update_event, :on => :create
  validate :create_and_update_event, :on => :update

  # Metodo para validar que solo EL ORGANIZADOR Y ADMINISTRADOR pueden crer y actualizar eventos
  def create_and_update_event
    user = User.find_by("id = ?", self.user_id)
    puts user.rol
    if user.rol != "ORGANIZADOR" || user.rol != "ADMINISTRADOR"
      errors.add(:message, 'No es permitido')
    end
  end

end
