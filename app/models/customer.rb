class Customer < ActiveRecord::Base

  has_one  :primary_address, -> { where(primary: true) }, class_name: "Address", dependent: :nullify
  has_many :addresses, dependent: :nullify
  has_many :orders, dependent: :nullify

  validates :first_name, presence: true
  validates :last_name, presence: true

end
