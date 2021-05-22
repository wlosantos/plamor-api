class Register < ApplicationRecord

  belongs_to :user
  belongs_to :parent, class_name: 'Register', optional: true
  has_many :sub_registers, class_name: 'Register', foreign_key: :parent_id, dependent: :destroy

  enum plain: %i[ holder dependent ]
  enum status: %i[ active inactive ]

  validates :name, :contract, :birth, presence: true
  before_validation :validate_cpf, on: [:create, :update]

  protected

  def validate_cpf
    errors.add(:cpf, 'is invalid!!!') unless CPF.valid?(self.cpf)
  end
end
