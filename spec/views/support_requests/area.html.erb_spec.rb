require 'spec_helper'

describe "support_requests/area.html.erb" do
  before :each do
    render
  end
  it "has a link to new support request page" do
    rendered.should =~ /Submit a Support Request/
  end
  it "has a link to the faq pages" do
    rendered.should =~ /FAQ\/Knowledge Base/
  end
  it "has a link to the known issues" do
    rendered.should =~ /Known Issues/
  end
  it "has a link to the support board" do
    rendered.should =~ /The Support Board/
  end
end
