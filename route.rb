require_relative 'instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    register_instance
  end

  def to_s
    "Route from #{first_station.name} to #{last_station.name}"
  end

  def first_station
    stations.first
  end

  def last_station
    stations.last
  end

  def add_station(station)
    stations.insert(-2, station) unless stations.include?(station)
  end

  def del_station(station)
    stations.delete(station) unless [first_station, last_station].include?(station)
  end

  def stations_list
    stations.each { |x| puts x.name }
  end
end
