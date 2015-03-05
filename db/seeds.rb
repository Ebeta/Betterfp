<<<<<<< HEAD
5.times do
    Entity.create(name: Faker::Company.name, name: Faker::NAME)
end


Entity.all.each do |e|
    5.times do
        Patient.create(name: Faker::Name.name, email: Faker::Internet.email, entity: e)
    end
end

10.times do
    Medication.create(name: Faker::Name.name, contact: Faker::Name.name, age: Faker::Number.number(2))
end

=======
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'faker'


Entity.create(title: "Hospital", name: "Admin", location: "Miami, FL")
Entity.create(title: "Hospital", name: "Admin", location: "Miami, FL")
Entity.create(title: "Hospital", name: "Admin", location: "Miami, FL")
Entity.create(title: "Hospital", name: "Admin", location: "Miami, FL")
Entity.create(title: "Hospital", name: "Admin", location: "Miami, FL")


Entity.all.each do |e|

    Patient.create(name: "Lisa Simpson", age: "8", gender: "female", entity: e)
    Patient.create(name: "Marge Simpson", age: "36", gender: "female", entity: e)
    Patient.create(name: "Homer Simpson", age: "38", gender: "male", entity: e)
    Patient.create(name: "Bart Simpson", age: "10", gender: "male", entity: e)
    Patient.create(name: "Maggie Simpson", age: "2", gender: "female", entity: e)

end


Medication.create(name: "Xanax", description: "Anti-depressant")
Medication.create(name: "Tylenol", description: "Advil's enemy")
Medication.create(name: "Advil", description: "Pain-Reliever")
Medication.create(name: "OtherMed", description: "Anti-itch")
Medication.create(name: "Med5", description: "Fever reducer")
>>>>>>> addpages
