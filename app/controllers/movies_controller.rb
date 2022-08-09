class MoviesController < ApplicationController
  load_and_authorize_resource

  before_action :set_movie, only: [:edit, :update, :show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def search_queries
    # if params[:search_query]
    @movies = Movie.text_search(params[:search_query]).page(params[:page]).per_page(3)
    # else
    #   flash[:error] = "Oops, there were no record could be found !"
    # end
  end

  def index
    if params[:category].blank?
      @movies = Movie.paginate(page: params[:page], per_page: 9)
    else
      @category_id = Category.find_by(category_name: params[:category]).id
      @movies = Movie.where(category_id: @category_id).order("created_at DESC").paginate(page: params[:page], per_page: 3)
    end
  end

  def new
    @movie = Movie.new
    @categories = Category.all.map{ |c| [c.category_name, c.id] }
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "Movie's details Added Successfully!"
      redirect_to movies_path
    else
      flash[:error] = "Movie can't be added!"
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      flash[:notice] = "Movie Has Been Updated Successfully!"
      redirect_to movies_path
    else
      flash[:error] = "Updation Operation Has Been Failed!"
      render :edit
    end
  end

  def show
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      redirect_to movies_path
    else
      flash[:error] = "Deletion Operation Has Been Failed!"
    end
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:search_query, :movie_title, :movie_description, :movie_duration, :movie_language, :movie_release_date, :movie_rating, :category_id, :image, :theater_id)
    end
end
