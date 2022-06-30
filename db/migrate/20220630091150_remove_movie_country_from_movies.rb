class RemoveMovieCountryFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :movie_country, :string
  end
end
