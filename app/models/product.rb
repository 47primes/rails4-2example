class Product < ActiveRecord::Base

  def self.current
    order("created_at desc").last
  end

  has_many :orders

  validates :price, presence: true

end
