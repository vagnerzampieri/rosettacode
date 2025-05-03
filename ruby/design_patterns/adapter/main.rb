# frozen_string_literal: true

# references:
# https://refactoring.guru/design-patterns/adapter
# https://www.youtube.com/watch?v=Fg1kEjaaBrs

require_relative 'tempory_data_store_adapter/memory'

adapter = TemporaryDataStoreAdapter::Memory.new
p adapter.set('key1', { name: 'John Doe', age: 30 })
p adapter.get('key1')
p adapter.delete('key1')
p adapter.get('key1')
