require 'rails_helper'

RSpec.describe "Movie Show" do
  before(:each) do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @studio_2 = Studio.create!(name: 'New Line Cinema', location: 'New York City')

    @movie_1 = @studio_2.movies.create!(title: 'Lord of the Rings', creation_year: '2000', genre: 'action')
    @movie_2 = @studio_1.movies.create!(title: 'Despicable Me', creation_year: '2010', genre: 'animation')

    @actor_1 = Actor.create!(name: 'Steve Carell', age: 60)
    @actor_2 = Actor.create!(name: 'Will Ferell', age: 55)
    @actor_3 = Actor.create!(name: 'Vigo Mortensen', age: 64)
    @actor_4 = Actor.create!(name: 'Mike Myers', age: 59)
    @actor_5 = Actor.create!(name: 'Jeff Goldblum', age: 70)
    @actor_6 = Actor.create!(name: 'Tom Hanks', age: 66)
  end

  describe "User Story 2" do
    it "displays the movie row data, and its actors" do
      # When I visit a movie's show page.
      visit "movies/#{@movie_1.id}"
      # I see the movie's title, creation year, and genre,
      expect(page).to have_content("Lord of the Rings")
      expect(page).to have_content("Year: 2000")
      expect(page).to have_content("Genre: Action")
    end

    it "lists actors from youngest to oldest, and average age" do
      # and a list of all its actors from youngest to oldest.
      # And I see the average age of all of the movie's actors
    end
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