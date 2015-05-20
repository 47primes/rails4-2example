class Address < ActiveRecord::Base
  COUNTRIES_CONFIG = Rails.root.join("config/countries.yml")

  belongs_to :customer
  has_many :orders, dependent: :nullify

  def short_format
    return "#{locality}, #{region}, #{country_code_alpha2}" if us_address? || region.present? && !Address.us_state_abbreviations.include?(region)
    "#{locality}, #{country_code_alpha2}"
  end

  def us_address?
    country_code_alpha2 == "US"
  end

  def self.countries
    YAML.load_file COUNTRIES_CONFIG
  end

  def self.us_state_abbreviations
    %w(AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)
  end

end
