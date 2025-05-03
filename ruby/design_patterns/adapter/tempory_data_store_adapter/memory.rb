# frozen_string_literal: true

require 'json'

module TemporaryDataStoreAdapter
  # Memory is a simple in-memory key-value store.
  # It is used to store temporary data in a hash.
  # It is not thread-safe and should not be used in a production environment.
  # It is only used for testing purposes.
  class Memory
    def initialize
      @store = {}
    end

    def set(key, value)
      @store[key.to_s] = JSON.generate(value)
      'OK'
    end

    def get(key)
      return nil unless (value = @store[key.to_s])

      JSON.parse(value)
    end

    def delete(key)
      return nil unless (value = @store[key.to_s])

      @store.delete key.to_s
      JSON.parse(value)
    end
  end
end
