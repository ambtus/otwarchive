###GIVEN

Given /^a user exists in the system$/ do
  user = Factory.create(:user, :login => "a_user")
  user.activate
end

Given /^a staffer exists in the system$/ do
  user = Factory.create(:user, :login => "a_staffer")
  user.activate
  user.support_staffer = "1"
end

Given /^I am logged in as a support staffer$/ do
  Given %{I am logged in as "a_staffer"}
  user = User.find_by_login("a_staffer")
  user.support_staffer = '1'
end

###WHEN
When /^a guest is looking at the support admin page$/ do
  Given %{I am logged out}
  visit admin_support_settings_path
end

When /^a user is looking at the support admin page$/ do
  Given %{I am logged in}
  visit admin_support_settings_path
end

When /^a staffer is looking at the support admin page$/ do
  Given %{I am logged in as a support staffer}
  visit admin_support_settings_path
end

When /^an admin is looking at the support admin page$/ do
  Given %{I am logged in as an admin}
  visit admin_support_settings_path
end

###THEN
Then /^they will be redirected to the home page$/ do
  assert_equal root_path, current_path
end

Then /^they will see an admin permissions missing message$/ do
  assert page.has_content?("I'm sorry, only an admin can look at that area.")
end

Then /^they can designate the user as a support staffer$/ do
  user = Factory.create(:user, {:login => "staffer"})
  role = Role.create(:name => "support_staffer")
  user.activate
  click_link("Manage roles")
  fill_in("Name or email", :with => "staffer")
  select("Regular User", :from => "Role")
  click_button("Find")
  check("user_roles_#{role.id}")
  click_button("Update")

  assert user.is_support_staffer?, "User should have support role"
end

Then /^they can remove the staffer designation from the user$/ do
  user = User.find_by_login("a_staffer")
  assert user.is_support_staffer?, "User should have support role"
  role = Role.find_by_name("support_staffer")

  click_link("Manage roles")
  uncheck("user_roles_#{role.id}")
  click_button("Update")

  assert !user.is_support_staffer?, "User should not have support role"
end
