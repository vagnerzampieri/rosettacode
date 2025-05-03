# frozen_string_literal: true

require_relative 'tempory_data_store_adapter/memory'

adapter = TemporaryDataStoreAdapter::Memory.new
p adapter.set('key1', { name: 'John Doe', age: 30 })
p adapter.get('key1')
p adapter.delete('key1')
p adapter.get('key1')
