require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :name, :trains

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    register_instance
    @@all_stations << self
  end

  def to_s
    "Station #{name}"
  end

  def arrive(train)
    trains << train
  end

  def depart(train)
    trains.delete(train)
  end

  def trains_by_type
    result_hash = Hash.new(0)
    trains.each { |train| result_hash[train.type] += 1 }
    result_hash
  end
end
