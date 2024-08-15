namespace :create_pets do
  desc 'Create pets'
  task create: :environment do
    10_000.times do
      pet_params = []
      pet_params_integer = []
      time = Time.now
      1000.times do
        kind_index = rand(4)
        kind = case kind_index
               when 0
                 'cat'
               when 1
                 'dog'
               when 2
                 'rabbit'
               when 3
                 'owl'
               end

        params = [{
          name: Faker::Creature::Dog.name,
          weight: rand(1.0..100.0),
          birthday: Faker::Date.birthday(min_age: 1, max_age: 20),
          kind: kind,
          created_at: time,
          updated_at: time
        }]
        pet_params.concat(params)
        pet_params_integer.concat(params.map { |param| param.merge(kind: kind_index) })
      end

      # PetInteger.insert_all(pet_params_integer)
      PetString.insert_all(pet_params)
      # PetStringIndex.insert_all(pet_params)
      # PetIntegerIndex.insert_all(pet_params_integer)
    end
  end
end
