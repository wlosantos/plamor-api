class Address < ApplicationRecord

  belongs_to :register

  validates :street, :number, :zipcode, :city, :state, :country, :neighborhood , presence: true

end
