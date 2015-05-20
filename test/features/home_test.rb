require File.expand_path("../../test_helper", __FILE__)

feature "Home" do 
  scenario "inserts Braintree client into Javascript variable" do
    Braintree::ClientToken.stub :generate, "some-client-token" do
      visit root_path
      
      page.body.must_include "var clientToken = 'some-client-token';"
    end
  end

  scenario "displays current product price" do
    Braintree::ClientToken.stub :generate, "" do
      visit root_path

      page.must_have_content "$23.99/case of 12"
    end
  end
end
