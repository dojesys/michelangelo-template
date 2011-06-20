Feature: User Profiles
  As a registered user of the website
  I want manage my user profile
  so I can change my profile info
  
  Scenario: User create a profile with valid data
    Given I am a user with an email "user@test.com" and password "please"
    When I sign in as "user@test.com/please"
    Then I should be signed in
    When I follow "My profile"
    And I fill in "Display name" with "User Name"
    And I fill in "About" with "I'm a cool User"
    And I choose "Male"
    And I fill in "Location" with "Right Here"
    And I fill in "Website" with "http://cool.i.am"
    And I fill in "Birthday" with "01/01/2000"
    And I select "English" from "Locale"
    And I press "Update Profile"
    Then I should see "Successfully updated profile."

  Scenario: User add a facebook authentication service to his profile
    Given I am a user with an email "user@test.com" and password "please"
    When I sign in as "user@test.com/please"
    Then I should be signed in
    When I follow "My profile"
    When I follow "authentications"
    Then I should see "Available authentications"
    When I follow "sign_in_facebook"
    Then I should see "Successfully authorized from Facebook account."

  Scenario: User add a google authentication service to his profile
    Given I am a user with an email "user@test.com" and password "please"
    When I sign in as "user@test.com/please"
    Then I should be signed in
    When I follow "My profile"
    When I follow "authentications"
    Then I should see "Available authentications"
    When I follow "sign_in_google_apps"
    Then I should see "Successfully authorized from Google account."

  Scenario: User add a twitter authentication service to his profile
    Given I am a user with an email "user@test.com" and password "please"
    When I sign in as "user@test.com/please"
    Then I should be signed in
    When I follow "My profile"
    When I follow "authentications"
    Then I should see "Available authentications"
    When I follow "sign_in_twitter"
    Then I should see "Successfully authorized from Twitter account."
