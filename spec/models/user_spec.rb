require 'spec_helper'

describe User do
  context "a valid user" do
    user = User.find_or_create_by_login("new_user")
    user.email = "new_user@ao3.org"
    user.password = "some paswword"
    user.password_confirmation = "some paswword"
    user.terms_of_service = "1"
    user.age_over_13 = "1"
    user.save!

    it "can have a tag wrangler role" do
      user.tag_wrangler = '1'

      user.is_tag_wrangler?.should be_true
    end
    it "can have a support staffer role" do
      user.support_staffer = '1'

      user.is_support_staffer?.should be_true
    end
  end
end
