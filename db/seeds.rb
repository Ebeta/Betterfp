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

