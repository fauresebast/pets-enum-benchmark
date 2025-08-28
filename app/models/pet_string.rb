class PetString < ApplicationRecord
  kind = [
    "Alaskan Malamute",
    "German Shepherd",
    "Golden Retriever",
    "Siberian Husky",
    "Labrador Retriever",
    "Rottweiler",
    "Great Dane",
    "Doberman Pinscher"
  ].freeze

  enum kind: kind.zip(kind).to_h
end
