Feature: create new user
 
  As a user
  So that I can use myMood
  I want to create a myMood account
  
Background: users are in the database
  
  Given the following users exist:
  | phone_number | name    | password | email |
  | 1234567890   | Alice   | hunter2  | a@a.a |
  | 1111111111   | Bob B   | abc      | b@b.b |

  And I am on the create account page
  
Scenario: Correct Information with an email
	When I fill in "Name" with "Carol"
	And I fill in "Number" with "222-222-2222"
	And I fill in "Password" with "password123"
	And I fill in "Confirm" with "password123"
	And I fill in "Email" with "carol@foo.com"
	
	And I press "Submit"

	Then "Carol" should be created with "2222222222", "password123", "carol@foo.com"
	And I should see "Thank you for logging in"
	And I should be on the user index


Scenario: Correct Information with no email
	When I fill in "Name" with "Carol"
	And I fill in "Number" with "222-222-2222"
	And I fill in "Password" with "password123"
	And I fill in "Confirm" with "password123"
	
	And I press "Submit"

	Then "Carol" should be created with "2222222222", "password123", ""
	And I should see "Thank you for logging in"
	And I should be on the user index
	
	

Scenario: Missing User Name
	When I fill in "Number" with "222-222-2222"
	And I fill in "Password" with "password123"
	And I fill in "Confirm" with "password123"
	
	And I press "Submit"

	Then I should see "Name is a required field."
	

Scenario: Missing Phone Number
  When I fill in "Name" with "Carol"
	And I fill in "Password" with "password123"
	And I fill in "Confirm" with "password123"
	
	And I press "Submit"

	Then I should see "Phone Number is a required field."
	

Scenario: Missing Password
	When I fill in "Name" with "Carol"
	And I fill in "Number" with "222-222-2222"
	And I fill in "Confirm" with "password123"
	
	And I press "Submit"

	Then I should see "Password is a required field."
	
Scenario: Missing Confirm Password
	When I fill in "Name" with "Carol"
	And I fill in "Number" with "222-222-2222"
	And I fill in "Password" with "password123"
	
	And I press "Submit"

	Then I should see '"Password" and "Confirm Password" do not match.'
	
Scenario: Password and Cofirm Password don't match
	When I fill in "Name" with "Carol"
	And I fill in "Number" with "222-222-2222"
	And I fill in "Password" with "password123"
	And I fill in "Confirm" with "Password123"
	
	And I press "Submit"

	Then I should see '"Password" and "Confirm Password" do not match.'
	
Scenario: Phone Number taken
	When I fill in "Name" with "Carol"
	And I fill in "Number" with "123-456-7890"
	And I fill in "Password" with "password123"
	And I fill in "Confirm" with "password123"
	
	And I press "Submit"

	Then I should see 'That phone number is already in our system.'
	
Scenario: Invalid Phone Number
	When I fill in "Name" with "Carol"
	And I fill in "Number" with "123"
	And I fill in "Password" with "password123"
	And I fill in "Confirm" with "password123"
	
	And I press "Submit"

	Then I should see 'Invalid Phone Number.'
	
Scenario: Invalid Phone Number (non-number)
	When I fill in "Name" with "Carol"
	And I fill in "Number" with "not a number"
	And I fill in "Password" with "password123"
	And I fill in "Confirm" with "password123"
	
	And I press "Submit"

	Then I should see 'Invalid Phone Number.'