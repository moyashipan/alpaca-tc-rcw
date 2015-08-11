module Recipe
  class Mapping
    class User < Base
      self.mapping_key = 'users'

      attr_reader :id, :user_name
    end
  end
end
