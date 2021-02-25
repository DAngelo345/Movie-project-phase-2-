class SessionsController < ApplicationController

  # GET: /sessions
  get "/login" do
    erb :"/sessions/login.html"
  end

  

  # POST: /sessions
  post "/login" do
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])

    else
      
    end
    binding.pry
  end

  get '/logout' do
    session.clear 
    redirect '/login'

  end

 
end
