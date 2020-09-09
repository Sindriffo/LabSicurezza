Feature: Delete a user
    I want to delete a user as admin

    Scenario: Delete a user
        
        Given a valid admin
        When I am on the login page 
        And I fill in "user_email" with "prova@example.it" 
        And I fill in "user_password" with "Topolino1." 
        And I press "Log in" 
        Then I should be on admin homepage
        

        Given I am on admin homepage
        When I follow "Lista utenti" 
        Then I should be on users
        
        Given a valid user
        When I am on Lista utenti
        And I press "Cancella utente"
        Then I should be on users


        