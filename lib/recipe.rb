require 'recipe/version'
require 'recipe/mapping'
require 'recipe/configuration'
require 'recipe/option'

module Recipe
  REQUIRED_KEYS = %i(recipe_path)

  def self.run(argv)
    Option.new(argv).parse!
    configuration.require_keys!(*REQUIRED_KEYS)

    rows = if id = configuration[:recipe_id]
             [Mapping::Recipe.find(id)]
           else
             Mapping::Recipe.all
           end

    rows.each do |row|
      puts <<-STR.gsub(/^\s{6}/, '')
      #{row.user.user_name}
      #{row.id}: #{row.name}
      #{row.description}

      STR
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
