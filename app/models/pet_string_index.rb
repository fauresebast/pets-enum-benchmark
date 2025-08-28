class PetStringIndex < ApplicationRecord
  kind = %w[cat dog rabbit owl crow fox parrot hedgehog tortoise].freeze

  enum kind: kind.zip(kind).to_h
end
