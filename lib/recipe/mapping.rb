require 'yaml'

require 'recipe/mapping/base'
require 'recipe/mapping/user'
require 'recipe/mapping/recipe'

module Recipe
  class Mapping
    def self.data
      @data ||= YAML.load_file(::Recipe.configuration[:recipe_path])
    end

    def self.find(id)
      data.find { |row| row['id'] == id }
    end
  end
end
