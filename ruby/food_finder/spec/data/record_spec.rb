require 'data/record'

RSpec.describe Data::Record do
  before do
    @path           = 'data/restaurants_test.txt'
    @data_record    = Data::Record.new(@path)

    path            = 'data/restaurants_testing.txt'
    @discarded_file = Data::Record.new(path)
  end

  context '#filepath' do
    it 'contains the full path' do
      expect(@data_record.filepath).to eql(File.join(ENV['APP_ROOT'], @path))
    end
  end

  context '#file_exists?' do
    it 'when the file exists, it must be true' do
      expect(@data_record.file_exists?).to eql(true)
    end

    it 'when the file does not exist, it must be false' do
      expect(@discarded_file.file_exists?).to eql(false)
    end
  end

  context '#file_usable?' do
    it 'when the file is usable, it must be true' do
      expect(@data_record.file_usable?).to eql(true)
    end

    it 'when the file is not usable, it must be false' do
      expect(@discarded_file.file_usable?).to eql(false)
    end
  end

  context '#create_file' do
    #depois de criar o arquivo devo remover ele

  end
end
