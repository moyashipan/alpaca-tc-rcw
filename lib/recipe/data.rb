require 'yaml'

module Recipe
  class Data
    def self.mapping
      @mapping = YAML.load_file(Recipe.configuration[:recipe_path])
    end

    def self.find(id)
      mapping.find { |row| row['id'] == id }
    end
  end
end
