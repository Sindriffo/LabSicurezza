Feature: I want to add "new travel"

Scenario: new travel
	 Given a valid user
        When I am on the login page 
        And I fill in "user_email" with "prova33@example.it" 
        And I fill in "user_password" with "Topolino1." 
        And I press "Log in" 
        Then I should be on the home page
        
        Given I am on the home page
        When I follow "Offri un passaggio"
        Then I should be on the new travels
        
        Given I am on the new travels
        Given a valid travel
        And I fill in "autocomplete_address" with "Roma" 
        And I fill in "autocomplete_address2" with "Milano"
        And I fill in "travel_data" with "12/12/2020" 
        And I fill in "travel_ora_partenza" with "10:00"
        And I fill in "travel_prezzo" with "12" 
        And I press "Conferma"
        Then I should be on the home page
