require 'benchmark'

class BenchmarkTime
  NUM_OF_TRIES = 1000.freeze
  def initialize
    Rails.cache.clear
  end

  def call
    get_time('cat')
    get_time_materialized_view('cat')
    get_time('dog')
    get_time_materialized_view('dog')
    get_time('rabbit')
    get_time_materialized_view('rabbit')
    get_time('owl')
    get_time_materialized_view('owl')
  end

  def get_time(kind)
    time = 0
    NUM_OF_TRIES.times do
      time += Benchmark.realtime { PetString.where(kind: kind).count }
      Rails.cache.clear
    end

    puts "PetString: #{time/NUM_OF_TRIES * 1000}"
  end

  def get_time_materialized_view(kind)
    time = 0
    NUM_OF_TRIES.times do
      time += Benchmark.realtime { PetStatistic.find(kind).pet_count }
      Rails.cache.clear
    end

    puts "Materialized View: #{time/NUM_OF_TRIES * 1000}"
  end
end
