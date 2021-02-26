class SessionsController < ApplicationController

  # GET: /sessions
  get "/login" do
    redirect "/movies" if logged_in?
    erb :"/sessions/login.html"
  end

  

  # POST: /sessions
  post "/login" do
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id 
      flash[:success] = "Successfully Logged in"
      redirect '/movies'
    else
      flash[:error] = "Invalid login"
      redirect '/login'
    end

  end

  get '/logout' do
    session.clear 
    redirect '/login'

  end

 
end
