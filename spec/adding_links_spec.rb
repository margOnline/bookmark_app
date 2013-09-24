require 'spec_helper'

feature "user adds a new link" do
  
  scenario "when browsing the homepage" do
    expect(Link.count).to eq(0)
    visit '/'
    add_link("http://www.margonline.co.uk", "margOnline")
    expect(Link.count).to eq(1)
    link = Link.first
    expect(link.url).to eq("http://www.margonline.co.uk")
    expect(link.title).to eq("margOnline")
  end

  scenario "with a few tags" do
    visit "/"
    add_link("http://www.makersacademy.com/", "Makers Academy",['education', 'ruby'])
    link = Link.first
    expect(link.tags.map(&:text)).to include("education")
    expect(link.tags.map(&:text)).to include("ruby")
  end

  def add_link(url, title, tags = [])
    within('#new-link') do
      fill_in 'url', :with => url
      fill_in 'title', :with => title
      fill_in 'tags', :with => tags.join(' ')
      click_button 'Add link'
    end
  end

end

