Feature: send group message

  As an admin
  So that I can make users more engaged
  I want to be able to send group messages

Background: Users exist in groups in the database

Given the following users exist:

  | User  | Group |
  | Alice | Blue  |
  | Bob	  | Blue  |
  | Carol | Red	  |

  And I am on the admin dashboard page

Scenario: get to send message view for one group
  When I select 'Blue Group'
  And I select 'Send Message'

  Then I should see the send message view
  And I should see 'Alice' in the To field
  And I should see 'Bob' in the To field
  And I should not see 'Carol' in the To field
  
Scenario: send message to that group
  When I am on the Blue group's send message view
  And I type a message
  And I select 'Send'

  Then I should be on the Blue Group page
  And I should see "Message sent to Blue Group"
