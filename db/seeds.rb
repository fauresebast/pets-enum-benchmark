def generated_data(size)
  (0...size).map do |i|
    {
      name: Faker::Creature::Dog.name,
      weight: rand(1.0..100.0),
      birthday: Faker::Date.birthday(min_age: 1, max_age: 20),
      kind: %w[cat dog rabbit owl][Random.rand(4)]
    }
  end
end

puts "[db/seeds] Deleting database"
PetInteger.delete_all
PetIntegerIndex.delete_all
PetPgsqlEnum.delete_all
PetPgsqlEnumIndex.delete_all
PetString.delete_all
PetStringIndex.delete_all

NUM_OF_RECORDS = 10_000_000

# Models:
# PetInteger, PetIntegerIndex
# PetPgsqlEnum, PetPgsqlEnumIndex
# PetString, PetStringIndex

puts "[db/seeds] Seeding database: creating #{NUM_OF_RECORDS} records per model"
(NUM_OF_RECORDS / 100_000).times do |i|
  puts i
  data = generated_data(100_000)
  PetPgsqlEnum.import data
  PetPgsqlEnumIndex.import data
end
puts "[db/seeds] records created"

PetStatistic.refresh
puts "[db/seeds] PetStatistic refreshed"

puts "[db/seeds] Database seeded"