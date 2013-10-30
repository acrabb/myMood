Feature: view user graphs as admin

        As an admin
        So that I can view trends and discuss moods with a group of users
        I want to view a group's mood graphs

Background: Users Alice, Bob, and Carol have submitted moods every day for the past two weeks

Given the following users exist:

  | User  | Group |
  | Alice | Blue  |
  | Bob	  | Blue  |
  | Carol | Red	  |

Given the following moods exist:

  | Day         | Mood Rating 	| User  |
  | 12-Oct-2013 | 3 		| Alice	|
  | 13-Oct-2013 | 4 		| Alice	|
  | 14-Oct-2013 | 3 		| Alice	|
  | 15-Oct-2013 | 5 		| Alice	|
  | 16-Oct-2013 | 7 		| Alice	|
  | 17-Oct-2013 | 2 		| Alice	|
  | 18-Oct-2013 | 5 		| Alice	|
  | 19-Oct-2013 | 3 		| Alice	|
  | 20-Oct-2013 | 4 		| Alice	|
  | 21-Oct-2013 | 3 		| Alice	|
  | 22-Oct-2013 | 5 		| Alice	|
  | 23-Oct-2013 | 7 		| Alice	|
  | 24-Oct-2013 | 2 		| Alice	|
  | 25-Oct-2013 | 5 		| Alice	|
  | 12-Oct-2013 | 7 		| Bob	|
  | 13-Oct-2013 | 4 		| Bob	|
  | 14-Oct-2013 | 5 		| Bob	|
  | 15-Oct-2013 | 6 		| Bob	|
  | 16-Oct-2013 | 2 		| Bob	|
  | 17-Oct-2013 | 1 		| Bob	|
  | 18-Oct-2013 | 8 		| Bob	|
  | 19-Oct-2013 | 3 		| Bob	|
  | 20-Oct-2013 | 2 		| Bob	|
  | 21-Oct-2013 | 1 		| Bob	|
  | 22-Oct-2013 | 7 		| Bob	|
  | 23-Oct-2013 | 5 		| Bob	|
  | 24-Oct-2013 | 6 		| Bob	|
  | 25-Oct-2013 | 9 		| Bob	|
  | 12-Oct-2013 | 2 		| Carol	|
  | 13-Oct-2013 | 8 		| Carol	|
  | 14-Oct-2013 | 9 		| Carol	|
  | 15-Oct-2013 | 7 		| Carol	|
  | 16-Oct-2013 | 8 		| Carol	|
  | 17-Oct-2013 | 9 		| Carol	|
  | 18-Oct-2013 | 6 		| Carol	|
  | 19-Oct-2013 | 2 		| Carol	|
  | 20-Oct-2013 | 1 		| Carol	|
  | 21-Oct-2013 | 4 		| Carol	|
  | 22-Oct-2013 | 6 		| Carol	|
  | 23-Oct-2013 | 4 		| Carol	|
  | 24-Oct-2013 | 3 		| Carol	|
  | 25-Oct-2013 | 8 		| Carol	|
  
  And I am on the mood graph page.
  
Scenario: restrict mood graph to just past week and to one group

  When I select 'Blue Group' parameter
  And I select 'past week' parameter
  And I press 'submit'
  
  Then I should see a mood graph
  And the mood graph should have 14 points
  And the dates should range from 7 days ago to today
  And I should see data for "Alice"
  And I should see data for "Bob"
  But I should not see data for "Carol"
  
Scenario: View entire mood graph for a group
  
  When I am on the mood graph page
  
  Then I should see a mood graph
  And the mood graph should have all days recorded in database
  And I should see data for "Alice"
  And I should see data for "Bob"
  But I should not see data for "Carol"
  
Scenario: View a single user's mood graph for the past week
  Given I am on the mood graph page
  When I select 'Alice' parameter
  And I select 'past week' parameter
  And I press 'submit'
  
  Then I should see a mood graph
  And the mood graph should have 7 points
  And the dates should range from 7 days ago to today
  And I should see data for "Alice"
  But I should not see data for "Bob"
  And I should not see data for "Carol"
  
