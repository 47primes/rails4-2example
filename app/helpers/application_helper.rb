module ApplicationHelper

  def state_dropdown_options
    options_for_select Address.us_state_abbreviations
  end

  def country_dropdown_options
    options_for_select Address.countries, "US"
  end

end
