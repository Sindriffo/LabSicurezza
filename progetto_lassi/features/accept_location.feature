Feature: Delete a travel
    I want to delete a travel as admin

    Scenario: Delete a travel
        
        Given a valid admin
        When I am on the login page 
        And I fill in "user_email" with "prova@example.it" 
        And I fill in "user_password" with "Topolino1." 
        And I press "Log in" 
        Then I should be on admin homepage
        

        Given I am on admin homepage
        When I follow "Lista utenti" 
        Then I should be on users
        
        
        Given I am on Lista utenti
        And a first user
        And I press "Cancella Utente"
        