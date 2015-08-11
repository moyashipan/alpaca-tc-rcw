module Recipe
  class Mapping
    class Recipe < Base
      self.record_name = 'recipes'

      attr_reader :id, :name, :description
      define_attribute_method :user, User, :user_id
    end
  end
end
