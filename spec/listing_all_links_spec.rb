require 'spec_helper'

feature "User browses the list of links" do
  
  before(:each) {
    Link.create(:url => "http://www.margonline.co.uk", :title => "margOnline")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("margOnline")
  end
  
end