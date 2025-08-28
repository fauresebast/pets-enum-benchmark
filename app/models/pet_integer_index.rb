class PetIntegerIndex < ApplicationRecord
  enum kind: {cat: 0, dog: 1, rabbit: 2, owl: 3, crow: 4, fox: 5, parrot: 6, hedgehog: 7, tortoise: 8}
end
