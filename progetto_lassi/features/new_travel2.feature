Feature: I want to join "a travel"

Scenario: join a travel
	 Given a valid user
        When I am on the login page 
        And I fill in "user_email" with "prova33@example.it" 
        And I fill in "user_password" with "Topolino1." 
        And I press "Log in" 
        Then I should be on the home page
        
        Given I am on the home page
        When I follow "Viaggi disponibili"
        Then I should be on travels
        
        
        Given I am on travels
        Given a valid travel
        When I press "Aggiungi"
        
        Then I should be on the home page
