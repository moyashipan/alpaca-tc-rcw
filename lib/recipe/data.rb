require 'yaml'

module Recipe
  class Data
    def self.mapping
      @mapping = YAML.load_file(Recipe.configuration[:recipe_path])
    end
  end
end
