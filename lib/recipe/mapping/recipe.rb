module Recipe
  class Mapping
    class Recipe < Base
      self.mapping_key = 'recipes'

      attr_reader :id, :name, :description
      define_attribute_method :user, User, :user_id
    end
  end
end
