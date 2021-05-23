class Contact < ApplicationRecord

  belongs_to :register

  enum kind: %i[ cell phone email whatsapp ]
  enum status: %i[ active inactive ]

  validates :kind, :description, :status, presence: true

end
