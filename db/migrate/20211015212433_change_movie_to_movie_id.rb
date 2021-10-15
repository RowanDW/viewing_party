class ChangeMovieToMovieId < ActiveRecord::Migration[5.2]
  def change
    change_column :parties, :movie, :integer, using: 'movie::integer'
  end
end
