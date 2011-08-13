Feature: There will be a support admin landing page

Scenario: guests can not visit admin page
  When a guest is looking at the support admin page
  Then they will be redirected to the home page
    And they will see an admin permissions missing message

Scenario: users can not visit admin page
  When a user is looking at the support admin page
  Then they will be redirected to the home page
    And they will see an admin permissions missing message

Scenario: staffers can not visit admin page
  When a staffer is looking at the support admin page
  Then they will be redirected to the home page
    And they will see an admin permissions missing message

Scenario: add staffer privileges
  Given a user exists in the system
  When an admin is looking at the support admin page
  Then they can designate the user as a support staffer

Scenario: remove staffer privileges
  Given a staffer exists in the system
  When an admin is looking at the support admin page
  Then they can remove the staffer designation from the user
