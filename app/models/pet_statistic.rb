class PetStatistic < ApplicationRecord
  self.primary_key = 'kind'

  def readonly?
    true
  end

  def self.refresh
    ActiveRecord::Base.connection.execute('REFRESH MATERIALIZED VIEW pet_statistics')
  end
end
