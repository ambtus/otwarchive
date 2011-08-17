###GIVEN

###WHEN

When 'anyone is looking at the support area page' do
  Given %{I am logged out}
  visit support_path
end


###THEN

Then 'they can follow a link to the "Submit a Support Request" page' do
  click_link("Submit a Support Request")
  assert_equal new_support_request_path, current_path
end

Then 'they can follow a link to the "FAQ/Knowledge Base" page' do
  click_link("FAQ/Knowledge Base")
  assert_equal archive_faqs_path, current_path
end

Then 'they can follow a link to the "Known Issues" page' do
  click_link("Known Issues")
  assert_equal known_issues_path, current_path
end

Then 'they can follow a link to the "The Support Board" page' do
  click_link("The Support Board")
  assert_equal support_requests_path, current_path
end
