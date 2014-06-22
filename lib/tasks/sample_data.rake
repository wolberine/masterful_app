

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Parent.create!(name: "Example Parent",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      Parent.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  make_children

address_array = ["19700 S Vermont Ave Suite Torrance, CA 90502",
                "25500 Hawthorne Blvd Torrance, CA 90505",
                "706 Knob Hill AveRedondo Beach, CA 90277",
                "2400 Nelson AveRedondo Beach, CA 90278",
                "2641 Manhattan Beach BlvdRedondo Beach, CA 90278",
                "22422 Palos Verdes BlvdTorrance, CA 90505",
                "315 S Peck AveManhattan Beach, CA 90266",
                "1650 S Pacific Coast Hwy Ste 110Redondo Beach, CA 90277",
                "528 Pacific Coast HwyHermosa Beach, CA 90254",
                "800 Torrance Blvd Redondo Beach, CA",
                "22410 Palos Verdes BlvdTorrance, CA 90505",
                "2311 Mathews Ave. Redondo Beach, CA 90278",
                "2221 Artesia BlvdRedondo Beach, CA 90278",
                "307 Pacific Coast HwyHermosa Beach, CA 90254",
                "1014 Aviation BlvdHermosa Beach, CA 90254",
                "919 S Pacific Coast Hwy, Redondo Beach, CA 90277"]


 15.times do |n|
      sleep 2
      name  = Faker::Company.name
      instruction = Faker::Commerce.department
      tagline = Faker::Company.catch_phrase
      address = address_array[n]
      photo = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
      business = Business.create!(name: name,
                   address: address,
                   instruction: instruction,
                   tagline: tagline,
                   photo: photo)
    end
  end

def make_children
  parents = Parent.all(limit: 10)
  5.times do
    name = Faker::Name.name
    gender = "male"
    date_of_birth = "2014-06-21"
    parents.each { |parent| parent.children.create!(name: name,
                                                    gender: gender,
                                                    date_of_birth: date_of_birth) }
  end
end

end

