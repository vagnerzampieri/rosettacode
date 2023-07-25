# frozen_string_literal: true

all_states_needed = Set['mt', 'wa', 'or', 'id', 'nv', 'ut', 'ca', 'az']

stations = {
  kone: Set['id', 'nv', 'ut'],
  ktwo: Set['wa', 'id', 'mt'],
  kthree: Set['or', 'nv', 'ca'],
  kfour: Set['nv', 'ut'],
  kfive: Set['ca', 'az']
}

final_stations = Set[]

until all_states_needed.empty?
  best_station = nil
  states_covered = Set[]

  stations.each do |station, states_for_station|
    covered = all_states_needed & states_for_station

    if covered.length > states_covered.length
      best_station = station
      states_covered = covered
    end
  end

  all_states_needed -= states_covered
  final_stations.add(best_station)
end

puts final_stations
