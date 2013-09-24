require 'spec_helper'

describe Link do

  context "demonstration of how datapmapper works" do

    it 'should be created and then retrieved from the db' do
      expect(Link.count).to eq(0)
      Link.create(:title => "margOnline", :url => "http://www.margonline.co.uk/")
      expect(Link.count).to eq(1)
      link = Link.first
      expect(link.url).to eq("http://www.margonline.co.uk/")
      expect(link.title).to eq('margOnline')
      link.destroy
      expect(Link.count).to eq(0)
    end
  end
end
