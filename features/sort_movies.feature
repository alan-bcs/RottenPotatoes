Feature: Sort movies alphabetically

  Scenario: View movie list after adding 2 movies (Imperative)
    Given I am on the Rotten Potatoes home page
    When I follow "Add new movie"
    Then I should be on the Create New Movie page
    When I fill in "Title" with "Zorro"
    And I select "PG" from "Rating"
    And I press "Save Changes"
    Then I should be on the Rotten Potatoes home page
    
    When I follow "Add new movie"
    Then I should be on the Create New Movie page
    When I fill in "Title" with "Apocalypse Now"
    And I select "R" from "Rating"
    And I press "Save Changes"
    Then I should be on the Rotten Potatoes home page
    
    When I follow "Movie Title"
    Then I should see "Apocalypse Now" before "Zorro"

    Scenario: View movie list after adding 2 movies (Declarative)
    Given the following movies exist:
      | title          | rating | release_date |
      | Zorro          | PG     | 1998-07-17   |
      | Apocalypse Now | R      | 1979-08-15   |
    And I am on the Rotten Potatoes home page
    When I follow "Movie Title"
    Then I should see "Apocalypse Now" before "Zorro"