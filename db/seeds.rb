puts "[ db/seeds.rb ] Deleting database"
PetInteger.delete_all
PetIntegerIndex.delete_all
PetPgsqlEnum.delete_all
PetPgsqlEnumIndex.delete_all
PetString.delete_all
PetStringIndex.delete_all

NUM_OF_RECORDS = 100_000

puts "[ db/seeds.rb ] Seeding database: preparing data"
columns = [:name, :weight, :birthday, :kind]
generated_data = (0..NUM_OF_RECORDS).map do |i|
  {
    name: Faker::Creature::Dog.name,
    weight: rand(1.0..100.0),
    birthday: Faker::Date.birthday(min_age: 1, max_age: 20),
    kind_id: Random.rand(4)
  }
end
pet_integer_kinds = generated_data.map { |data| [data[:name], data[:weight], data[:birthday], data[:kind_id]] }

puts "[ db/seeds.rb ] Seeding database: creating #{NUM_OF_RECORDS} records per model"

PetInteger.import columns, pet_integer_kinds
PetIntegerIndex.import columns, pet_integer_kinds
puts "[ db/seeds.rb ] PetInteger created"

kind = %w[cat dog rabbit owl].freeze
pet_string_kinds = generated_data.map { |data| [data[:name], data[:weight], data[:birthday], kind[data[:kind_id]]] }

PetPgsqlEnum.import columns, pet_string_kinds
PetPgsqlEnumIndex.import columns, pet_string_kinds
puts "[ db/seeds.rb ] PetPgsqlEnum created"

PetString.import columns, pet_string_kinds
PetStringIndex.import columns, pet_string_kinds
puts "[ db/seeds.rb ] PetString created"

PetStatistic.refresh
puts "[ db/seeds.rb ] PetStatistic refreshed"

puts "[ db/seeds.rb ] Database seeded"