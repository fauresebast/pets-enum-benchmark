class PetIntegerIndex < ApplicationRecord
  enum breed: {
  alaskan_malamute: 0,
  german_shepherd: 1,
  golden_retriever: 2,
  siberian_husky: 3,
  labrador_retriever: 4,
  rottweiler: 5,
  great_dane: 6,
  doberman_pinscher: 7
}
end
