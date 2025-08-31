require 'benchmark'

class BenchmarkModel
  NUM_OF_TRIES = 1000.freeze
  KINDS = %w[cat dog rabbit owl].freeze
  def initialize
    Rails.cache.clear
  end

  def call(model)
    @model = model.constantize
    return if @model.count.zero?

    puts "[app/services/benchmark_model] Benchmarking #{@model} with #{@model.count} records"
    result = {}
    KINDS.each do |kind|
      result[kind] = get_time(kind)
      puts "[app/services/benchmark_model] \t#{@model}.where(kind: #{kind}): #{result[kind] / NUM_OF_TRIES * 1000}ms"
    end
    puts "[app/services/benchmark_model] \t-> #{@model} mean: #{result.values.sum / NUM_OF_TRIES / KINDS.size * 1000}ms"
  end

  def get_time(kind)
    time = 0
    NUM_OF_TRIES.times do
      time += Benchmark.realtime { @model.where(kind: kind).count }
      Rails.cache.clear
    end

    time
  end
end
