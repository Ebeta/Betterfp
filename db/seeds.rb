5.times do
    Entity.create(title: ,name: Faker::NAME)
end


Entity.all.each do |e|
    5.times do
        Patient.create(name: Faker::NAME, ,entity: e)
    end
end

