class Party < ApplicationRecord
  validates :movie, :duration, :day, :start_time, presence: true
  validates :host_id, presence: true
  validates :duration, numericality: true

  has_many :invites, dependent: :destroy
  has_many :guests, foreign_key: :guest_id, through: :invites

  belongs_to :host, class_name: 'User'

  def title
    movie = MovieFacade.movie_show(self.movie)
    movie.title
  end
end
