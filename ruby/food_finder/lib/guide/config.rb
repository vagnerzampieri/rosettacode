class Guide
  # Use:
  # Guide::Config.actions
  # => ['list', 'find', 'add', 'quit']
  class Config
    def self.actions
      %w(list find add quit)
    end
  end
end
