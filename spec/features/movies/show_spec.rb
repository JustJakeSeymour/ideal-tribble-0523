require 'rails_helper'

RSpec.describe "Movie Show" do
  describe "User Story 2" do
    it "displays the movie row data, and its actors" 
      # When I visit a movie's show page.
      # I see the movie's title, creation year, and genre,

      it "lists actors from youngest to oldest, and average age"
        # and a list of all its actors from youngest to oldest.
        # And I see the average age of all of the movie's actors
  end

  describe "Add an Actor to a Movie" do
    it "does not display actors that do not belong to the movie"
      # When I visit a movie show page,
      # I do not see any actors listed that are not part of the movie

    it "form to add an actor to the movie"
      # And I see a form to add an actor to this movie
      # When I fill in the form with the ID of an actor that exists in the database
      # And I click submit
      # Then I am redirected back to that movie's show page
      # And I see the actor's name is now listed
      # (You do not have to test for a sad path, for example if the id submitted is not an existing actor)

  end
end