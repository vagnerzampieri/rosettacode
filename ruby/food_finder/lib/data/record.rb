class Data
  class Record
    def initialize(path)
      @path = path
    end

    def filepath
      File.join(ENV['APP_ROOT'], @path)
    end

    def file_exists?
      File.exist?(filepath)
    end

    def file_usable?
      if file_exists? and readable? and writable?
        true
      else
        false
      end
    end

    def create_file
      File.open(filepath, 'w') unless file_exists?
      file_usable?
    end

    private

    def readable?
      File.readable?(filepath)
    end

    def writable?
      File.writable?(filepath)
    end
  end
end
