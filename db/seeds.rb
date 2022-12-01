puts "🌱 Seeding spices..."

# Seed your database here
MuseumPass.create(name: "Natural History Museum", website: "www.naturalhistorymuseum.org")
MuseumPass.create(name: "Modern Art Museum", website: "www.modernart.com")
MuseumPass.create(name: "Historical Society", website: "www.history.org")
MuseumPass.create(name: "Children's Museum", website: "www.kidsmuseum.edu")
MuseumPass.create(name: "Botanical Gardens", website: "www.gardens.org")

puts "✅ Done seeding!"
