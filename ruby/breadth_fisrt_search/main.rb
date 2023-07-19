# frozen_string_literal: true

GRAFO = {
  you: %w[alice bob claire],
  bob: %w[anuj peggy],
  alice: ['peggy'],
  claire: %w[thom jonny],
  anuj: [],
  peggy: [],
  thom: [],
  jonny: []
}.freeze

def person_is_seller(name)
  name[-1] == 'm'
end

def search(name)
  search_queue = []
  search_queue += GRAFO[name.to_sym]
  searched = []

  while search_queue.any?
    person = search_queue.shift
    next if searched.include?(person)

    if person_is_seller(person)
      puts "#{person} is a seller!"
      return true
    end

    search_queue += GRAFO[person.to_sym]
    searched << person
  end
end

search('alice')
