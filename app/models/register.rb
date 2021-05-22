class Register < ApplicationRecord

  belongs_to :user
  has_many :address
  belongs_to :parent, class_name: 'Register', optional: true
  has_many :sub_registers, class_name: 'Register', foreign_key: :parent_id, dependent: :destroy

  enum plain: %i[ holder dependent ]
  enum status: %i[ active inactive ]

  validates :name, :contract, :birth, presence: true
  # validates :cpf, uniqueness: true
  before_validation :validate_cpf, on: [:create, :update]
  before_validation :set_dependent, on: :create

  protected

  def validate_cpf
    errors.add(:cpf, 'is invalid!!!') unless CPF.valid?(self.cpf)
  end

  def set_dependent
    if self.parent_id.nil? || self.parent_id == ''
      self.plain  = :holder
    else
      self.plain = :dependent
    end
  end
end
