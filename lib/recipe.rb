require 'recipe/version'
require 'recipe/data'
require 'recipe/configuration'
require 'recipe/option'

module Recipe
  REQUIRED_KEYS = %i(recipe_path)

  def self.run(argv)
    Option.new(argv).parse!
    configuration.require_keys!(*REQUIRED_KEYS)

    Data.mapping.each do |row|
      puts row['name']
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
