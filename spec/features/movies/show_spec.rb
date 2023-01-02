require 'rails_helper'

RSpec.describe "Movie Show" do
  before(:each) do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @studio_2 = Studio.create!(name: 'New Line Cinema', location: 'New York City')

    @movie_1 = @studio_2.movies.create!(title: 'Lord of the Rings', creation_year: '2000', genre: 'action')
    @movie_2 = @studio_1.movies.create!(title: 'Despicable Me', creation_year: '2010', genre: 'animation')

    @actor_1 = Actor.create!(name: 'Orlando Bloom', age: 45)
    @actor_2 = Actor.create!(name: 'Elija Wood', age: 41)
    @actor_3 = Actor.create!(name: 'Vigo Mortensen', age: 64)
    @actor_4 = Actor.create!(name: 'Ian McKellen', age: 83)
    @actor_5 = Actor.create!(name: 'Jeff Goldblum', age: 70)
    @actor_6 = Actor.create!(name: 'Cate Blanchett', age: 53)

    MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_1.id)
    MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_2.id)
    MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_3.id)
    MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_4.id)
  end

  describe "User Story 2" do
    it "displays the movie row data, and its actors" do
      # When I visit a movie's show page.
      visit "movies/#{@movie_1.id}"
      # I see the movie's title, creation year, and genre,
      expect(page).to have_content("Lord of the Rings")
      expect(page).to have_content("Year: 2000")
      expect(page).to have_content("Genre: Action")
      expect(page).to_not have_content("Despicable Me")
    end
    
    it "lists actors from youngest to oldest, and average age" do
      visit "movies/#{@movie_1.id}"
      # and a list of all its actors from youngest to oldest.
      expect("Elija Wood").to appear_before("Orlando Bloom")
      expect("Orlando Bloom").to appear_before("Vigo Mortensen")
      expect("Vigo Mortensen").to appear_before("Ian McKellen")
      # And I see the average age of all of the movie's actors
      expect(page).to have_content("Average Age: 58.25")
    end
  end
  
  describe "Add an Actor to a Movie" do
    it "does not display actors that do not belong to the movie" do
      # When I visit a movie show page,
      visit "movies/#{@movie_1.id}"
      # I do not see any actors listed that are not part of the movie
      expect(page).to_not have_content("Cate Blanchett")
      expect(page).to_not have_content("Jeff Goldblum")
    end
    
    xit "form to add an actor to the movie" do
      visit "movies/#{@movie_1.id}"
      # And I see a form to add an actor to this movie
      expect(page).to have_form("Add Actor")
      # When I fill in the form with the ID of an actor that exists in the database
      fill_in "Add Actor", with: @actor_6.id
      # And I click submit
      click_button "Submit"
      # Then I am redirected back to that movie's show page
      expect(current_path).to eq("movies/#{@movie_1.id}")
      # And I see the actor's name is now listed
      expect(page).to have_content("Cate Blanchett")
    end

    # (You do not have to test for a sad path, for example if the id submitted is not an existing actor)
  end
end