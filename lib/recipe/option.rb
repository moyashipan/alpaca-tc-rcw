require 'optparse'

module Recipe
  class Option
    def initialize(argv)
      @argv = argv.clone
    end

    def parse!
      opts = OptionParser.new

      opts.on('-i', '--id [Recipe ID]', Integer) do |id|
        configuration[:recipe_id] = id
      end

      opts.on('--path [Recipe YAML DATA]') do |path|
        configuration[:recipe_path] = path
      end

      opts.parse!(@argv)
    end

    private

    def configuration
      Recipe.configuration
    end
  end
end
