require 'rails_helper'

RSpec.describe "Studio Show Page" do
  before(:each) do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @studio_2 = Studio.create!(name: 'New Line Cinema', location: 'New York City')

    @movie_1 = @studio_2.movies.create!(title: 'Lord of the Rings', creation_year: '2000', genre: 'action')
    @movie_2 = @studio_2.movies.create!(title: 'Elf', creation_year: '2004', genre: 'holiday')
    @movie_3 = @studio_1.movies.create!(title: 'Despicable Me', creation_year: '2010', genre: 'animation')

    @actor_1 = Actor.create!(name: 'Orlando Bloom', age: 45)
    @actor_2 = Actor.create!(name: 'Elija Wood', age: 41)
    @actor_3 = Actor.create!(name: 'Will Ferell', age: 55)
    @actor_4 = Actor.create!(name: 'Steve Carell', age: 60)

    MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_1.id)
    MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_2.id)
    MovieActor.create!(movie_id: @movie_2.id, actor_id: @actor_2.id)
    MovieActor.create!(movie_id: @movie_2.id, actor_id: @actor_3.id)
    MovieActor.create!(movie_id: @movie_3.id, actor_id: @actor_4.id)
  end

  describe "Studio's Actors" do
    it "lists actors that have been in any studio movie" do
      # When I visit a studio's show page
      visit "/studios/#{@studio_2.id}"
      # I see the studio's name and location
      expect(page).to have_content("New Line Cinema")
      expect(page).to have_content("Location: New York City")
      # And I see a unique list of all of the actors that have worked on any of this studio's movies.
      expect(page).to have_content("Orlando Bloom", count: 1)
      expect(page).to have_content("Elija Wood", count: 1)
      expect(page).to have_content("Will Ferell", count: 1)
      expect(page).to_not have_content("Steve Carell")
    end
  end
end