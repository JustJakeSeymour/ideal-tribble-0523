class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.ordered_by_age
    self.order(:age)  
  end

  def self.average_age
    self.average(:age)
  end
end