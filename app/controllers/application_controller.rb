class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  #read list of passes: get
  get "/passes" do
    passes = MuseumPass.all
    passes.to_json
  end
  
  #read list of reservations per pass: get
  get "/passes/:id" do
    pass = MuseumPass.find(params[:id])
    pass.to_json(include: :reservations)
  end
  
  #create new pass: post
  post "/passes" do
    new_pass = MuseumPass.create(
      name: params[:name],
      website: params[:website]
    )
    new_pass.to_json
  end

  #create reservation for pass: post
  post "/passes/:id" do
    pass = MuseumPass.find(params[:id])
    pass.reserve(
      name: params[:name],
      email: params[:email],
      check_out: params[:check_out]
    )
    pass.reservations.to_json
  end

  #update and change date of reservation: patch
  
  #delete reservation: delete
 



end
