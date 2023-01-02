require 'rails_helper'

RSpec.describe "Studio Index" do
  before(:each) do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    studio_2 = Studio.create!(name: 'New Line Cinema', location: 'New York City')
    studio_3 = Studio.create!(name: 'Disney', location: 'Studio City')  

    movie_1 = studio_3.movies.create!(title: 'Toy Story', creation_year: '1995', genre: 'animation')
    movie_2 = studio_3.movies.create!(title: 'Aristocats', creation_year: '1985', genre: 'animation')
    movie_3 = studio_2.movies.create!(title: 'Lord of the Rings', creation_year: '2000', genre: 'action')
    movie_4 = studio_2.movies.create!(title: 'Elf', creation_year: '2004', genre: 'holiday')
    movie_5 = studio_1.movies.create!(title: 'Jurassic Park', creation_year: '1993', genre: 'action')
    movie_6 = studio_1.movies.create!(title: 'Despicable Me', creation_year: '2010', genre: 'animation')
  end

  describe "User Story 1" do
    it "lists all studio names, locations" do
      # When I visit the studio index page,
      visit '/studios'
      # Then I see all of the studios including name and location,
      expect(page).to have_content("Universal Studios")
      expect(page).to have_content("Location: Hollywood")
      expect(page).to have_content("New Line Cinema")
      expect(page).to have_content("Location: New York City")
      expect(page).to have_content("Disney")
      expect(page).to have_content("Location: Studio City")
      expect(page).to_not have_content("Warner Brothers")
    end
    
    it "displays studio movies (and details) under each studio" do
      visit '/studios'
      # And under each studio I see all of the studio's movies
      # including the movie's title, creation year, and genre
      within("##{studio_1.id}") do
        expect(page).to have_content("Jurrassic Park")
        expect(page).to have_content("Year: 1993")
        expect(page).to have_content("Genre: Action")
        expect(page).to have_content("Despicable Me")
        expect(page).to have_content("Year: 2010")
        expect(page).to have_content("Genre: Animation")
        expect(page).to_not have_content("Elf")
      end
      
      within("##{studio_2.id}") do
        expect(page).to have_content("Lord of the Rings")
        expect(page).to have_content("Year: 2000")
        expect(page).to have_content("Genre: Action")
        expect(page).to have_content("Elf")
        expect(page).to have_content("Year: 2004")
        expect(page).to have_content("Genre: Holiday")
        expect(page).to_not have_content("Jurrassic Park")
      end
      
      within("##{studio_3.id}") do
        expect(page).to have_content("Toy Story")
        expect(page).to have_content("Year: 1995")
        expect(page).to have_content("Genre: Animation")
        expect(page).to have_content("Aristocats")
        expect(page).to have_content("Year: 1985")
        expect(page).to have_content("Genre: Animaiton")
        expect(page).to_not have_content("Lord of the Rings")
      end
    end
  end
end