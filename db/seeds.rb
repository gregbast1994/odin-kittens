50.times do |n|
    Kitten.create!( name: Faker::Creature::Cat.name,
                    age: rand(14) + 1, 
                    cuteness: rand(10) + 1,
                    softness: rand(10) + 1 )
end