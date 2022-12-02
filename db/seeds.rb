require 'faker'

puts "🌱 Seeding spices..."

# Seed your database here

# Seeds Generic Passes
MuseumPass.create(name: "Natural History Museum", website: "www.naturalhistorymuseum.org")
MuseumPass.create(name: "Modern Art Museum", website: "www.modernart.com")
MuseumPass.create(name: "Historical Society", website: "www.history.org")
MuseumPass.create(name: "Children's Museum", website: "www.kidsmuseum.edu")
MuseumPass.create(name: "Botanical Gardens", website: "www.gardens.org")

MuseumPass.all.each do |museum|
    10.times do
        fake_date = Faker::Date.forward(days: 90).to_s
        if museum.no_conflicts?(check_out: fake_date)
            museum.reserve(
                name: Faker::Name.name,
                email: Faker::Internet.safe_email,
                check_out: fake_date
            )
        else end
    end
end
puts "✅ Done seeding!"
