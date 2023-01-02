require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it {should have_many :movies}
  end

  describe 'methods' do
    xit "unique actors" do
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

      expect(@studio_2.unique_actors).to eq([@actor_1, @actor_2, @actor_3])
    end
  end

end
