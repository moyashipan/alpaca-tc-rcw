require 'recipe/version'
require 'recipe/data'
require 'recipe/option'

module Recipe
  def self.run(argv)
    Option.new(argv).parse!
    puts Data.mapping.find { |row| row['id'] == 1 }['name']
  end

  def self.configuration
    @configuration ||= {}
  end

  def self.configure
    yield(configuration)
  end
end
