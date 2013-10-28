Feature: display all previous moods in graph

        As a user
        So that I can quickly view mood trends over time
        I want to see the history of my moods presented as a graph

Background: User has submitted moods every day for the past 2 weeks

Given the following moods exist:

  | Day         | Mood Rating |
  | 12-Oct-2013 | 3 |
  | 13-Oct-2013 | 4 |
  | 14-Oct-2013 | 3 |
  | 15-Oct-2013 | 5 |
  | 16-Oct-2013 | 7 |
  | 17-Oct-2013 | 2 |
  | 18-Oct-2013 | 5 |
  | 19-Oct-2013 | 3 |
  | 20-Oct-2013 | 4 |
  | 21-Oct-2013 | 3 |
  | 22-Oct-2013 | 5 |
  | 23-Oct-2013 | 7 |
  | 24-Oct-2013 | 2 |
  | 25-Oct-2013 | 5 |
  
  And I am on the mood graph page.
  
Scenario: restrict mood graph to just past week.

  When I select 'past week' parameter
  And I press 'submit'
  Then I should see a mood graph
  And the mood graph should have 7 points
  And the dates should range from 7 days ago to today
  
Scenario: View entire mood graph
  
  When I am on the mood graph page
  Then I should see a mood graph
  And the mood graph should have all days recorded in database
  

  
