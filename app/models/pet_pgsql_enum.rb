class PetPgsqlEnum < ApplicationRecord
  kind = %i[cat dog rabbit owl].freeze

  enum kind: kind.index_by(&:to_s)
end
