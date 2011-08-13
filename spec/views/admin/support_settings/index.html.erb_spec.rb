require 'spec_helper'

describe "admin/support_settings/index.html.erb" do
  it "has a link to user roles" do
    render

    rendered.should =~ /Manage roles/
  end
end
