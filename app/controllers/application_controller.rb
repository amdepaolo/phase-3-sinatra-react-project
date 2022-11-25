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
    if pass.no_conflicts?(check_out:params[:check_out])
      pass.reserve(
        name: params[:name],
        email: params[:email],
        check_out: params[:check_out]
      )
      pass.reservations.to_json
    else 
      {error: "This reservation cannot be made as it conflicts with another reservation. Please check for other available dates"}.to_json
    end
  end

  #update and change date of reservation: patch
  patch "/reservations/:id" do
    reservation = Reservation.find(params[:id])
    if reservation.museum_pass.no_conflicts?(check_out: params[:check_out], check_in: params[:check_in])
      reservation.update(
        name: params[:name],
        email: params[:email],
        check_out: Date.parse(params[:check_out]),
        check_in: Date.parse(params[:check_in])
      )
      reservation.to_json
    else
      {error: "This edit cannot be made as it would put the reservation in conflict with another reservation."}.to_json
    end
  end

  #delete reservation: delete
  delete "/reservations/:id" do
    reservation = Reservation.find(params[:id])
    reservation.destroy
    reservation.to_json
  end

end
