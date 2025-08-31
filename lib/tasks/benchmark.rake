require 'benchmark'

namespace :benchmark do
  task all: :environment do
    BenchmarkModel.new.call('PetPgsqlEnum')
    BenchmarkModel.new.call('PetPgsqlEnumIndex')
    BenchmarkModel.new.call('PetInteger')
    BenchmarkModel.new.call('PetIntegerIndex')
    BenchmarkModel.new.call('PetString')
    BenchmarkModel.new.call('PetStringIndex')
  end
end
