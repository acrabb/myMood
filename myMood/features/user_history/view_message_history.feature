Feature: display all previous messages to and from user

        As a user
        So that I can view my message history quickly
        I want to see all messages I have recieved and sent
        
Background: User and associated admin have been sending messages.

Given that the following messages exist:

  | Day Sent    |            Message Content                 |
  | 18-Oct-2013 | "Hello, Emily! How are you feeling today?" |
  | 19-Oct-2013 | "Hello, Emily! How are you feeling today?" |
  
  |   Day Sent  | Message Content |
  | 18-Oct-2013 | 10              |
  | 19-Oct-2013 | 10              |
  
Scenario: User goes to message history page
  When I go to my message history page
  Then I should see all messages I have sent
  And I should see all messages sent to me
  And the messages should appear in order from newest to oldest
  And the day sent should appear next to each message.
