require 'rails_helper'

RSpec.describe Actor do
  describe "relationships" do
    it {should have_many :movie_actors}
    it {should have_many :movies}
  end

  describe 'methods' do
    it "ordered_by_age" do
      actor_1 = Actor.create!(name: 'Orlando Bloom', age: 45)
      actor_2 = Actor.create!(name: 'Elija Wood', age: 41)
      actor_3 = Actor.create!(name: 'Vigo Mortensen', age: 64)
      actor_4 = Actor.create!(name: 'Ian McKellen', age: 83)
      
      expect(Actor.ordered_by_age).to eq [actor_2, actor_1, actor_3, actor_4]
      
      actor_5 = Actor.create!(name: 'Cate Blanchett', age: 53)
      
      expect(Actor.ordered_by_age).to eq [actor_2, actor_1, actor_5, actor_3, actor_4]
    end

    it "age_average" do
      actor_1 = Actor.create!(name: 'Orlando Bloom', age: 45)
      actor_2 = Actor.create!(name: 'Elija Wood', age: 41)
      actor_3 = Actor.create!(name: 'Vigo Mortensen', age: 64)
      actor_4 = Actor.create!(name: 'Ian McKellen', age: 83)
      
      expect(Actor.average_age).to eq 58.25

      actor_5 = Actor.create!(name: 'Cate Blanchett', age: 53)
      
      expect(Actor.average_age).to eq 57.20
    end
  end
end