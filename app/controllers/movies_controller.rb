class MoviesController < ApplicationController

  # GET: /movies
  get "/movies" do
    redirect_if_not_logged_in

    if params[:search]
      @movies = Movie.where("title like ?", "%#{params[:search]}%")
    else 
      @movies = Movie.all
      # binding.pry

    end
    erb :"/movies/index.html"
  end

  # GET: /movies/new
  get "/movies/new" do
    redirect_if_not_logged_in
    erb :"/movies/new.html"
  end

  # POST: /movies
  post "/movies" do
    redirect_if_not_logged_in
    create_movie = Movie.new(params[:movie])
    create_movie.owner = current_user
    if create_movie.save
      current_user.movies << create_movie
      flash[:success] = "Successfully created a new movie!"
    redirect "/movies"
    else
      flash[:error] = create_movie.errors.full_messages.first
      redirect '/movies/new'
    end
  end

  # GET: /movies/5
  get "/movies/:id" do
    redirect_if_not_logged_in
    @movie = Movie.find_by(id: params[:id])
    erb :"/movies/show.html"
  end

  # GET: /movies/5/edit
  get "/movies/:id/edit" do
    redirect_if_not_logged_in
    id = params[:id]
    @movie = Movie.find_by(id: id)
    if current_user == @movie.owner
    erb :"/movies/edit.html"
    else
      flash[:error] = "wrong owner"
      redirect "/movies/#{@movie.id}"
    end

  end

  # PATCH: /movies/5
  patch "/movies/:id" do
    redirect_if_not_logged_in
    id = params[:id]
    movie = Movie.find_by(id: id)
    attrs = params[:movie]
    if current_user == movie.owner
      if movie.update(attrs)
        flash[:success] = "Movie successfully updated"
        redirect "/movies/#{movie.id}"
      else
        flash[:error] = movie.errors.full_messages.first
        redirect "/movies/#{movie.id}/edit"
      end
    else
      flash[:error] = "wrong owner"
      redirect "/movies/#{movie.id}"
    end
  end

  # DELETE: /movies/5/delete
  delete "/movies/:id" do
    redirect_if_not_logged_in
    id = params[:id]
    movie = Movie.find_by(id: id)
    if current_user == movie.owner
      if Movie.destroy(id)
        flash[:success] = "Movie successfully destroyed"
        redirect "/users/#{current_user.id}"
      else
        flash[:error] = movie.errors.full_messages.first
        redirect "/movies/#{movie.id}"
      end
    else
      flash[:error] = "wrong owner"
      redirect "/movies/#{movie.id}"
    end
  end
  get "/movies/:id/favorite" do 
    redirect_if_not_logged_in
    id = params[:id]
    movie = Movie.find_by(id: id)
    if current_user.movies.include?(movie)
      current_user.movies.delete(movie)
    else 
      current_user.movies << movie
    end
    redirect "/movies"
  end

end
