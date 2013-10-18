Feature: recieve and reply to message from admin

        As a user
        So that I can record my mood on the myMood websited
        I want to be reminded on a regular basis to record my mood so I can view history on
        the website.
        
Background: Admin has prescheduled messages to ask about moods of patients.
  
  Given the admin has sent a text message asking what their mood is and I am logged into mymood
  
Scenario: User recieves message via text message on phone, and replies with a "5", looks in message history.
  When I open the text message
  And I respond with mood level 5
  Then I should see 5 recorded in my message history
  And the message should appear on today's date
  
Scenario: User recieves message via text message on phone, replies with 5, looks at mood graph.
  When I open the text message
  And I respond with mood level 5
  Then I should see another point on my mood graph
  And that point should have mood level 5
  And that point should be on today's date
        
